from flask import Flask, render_template, request, redirect, url_for, session, flash
from werkzeug.security import generate_password_hash, check_password_hash
from flask_sqlalchemy import SQLAlchemy

# Inisialisasi aplikasi Flask
app = Flask(__name__)
app.secret_key = 'blablabla12'

# Konfigurasi database menggunakan SQLAlchemy
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://root:@localhost/manajemen_pengguna'  
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

db = SQLAlchemy(app)

# tabel users
class Users(db.Model):
    __tablename__ = 'users'  
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(100), nullable=False, unique=True) 
    email = db.Column(db.String(100), nullable=False, unique=True)  
    role = db.Column(db.String(50), nullable=False)  
    password_hash = db.Column(db.String(200))  

    def __repr__(self):
        return f"<User {self.username}>"

# Route 
@app.route('/')
def index():
    return render_template('index.html')

@app.route('/register', methods=['GET', 'POST'])
def register():
    if request.method == 'POST':
        username = request.form['username']
        email = request.form['email']
        password = request.form['password']
        confirm_password = request.form['confirm_password']
        role = request.form.get('role', 'user')

        # Validasi password
        if password != confirm_password:
            flash('Passwords do not match!', 'danger')
            return redirect(url_for('register'))

        # Hash password
        hashed_password = generate_password_hash(password)
        
        # Membuat objek user baru
        new_user = Users(username=username, email=email, password_hash=hashed_password, role=role)

        try:
            db.session.add(new_user)
            db.session.commit()
            flash('Registration successful! Please log in.', 'success')
            return redirect(url_for('login'))
        except Exception as e:
            flash(f'Error occurred: {e}', 'danger')
            return redirect(url_for('register'))

    return render_template('register.html')

# Route untuk login user
@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        email = request.form['email']
        password = request.form['password']

        user = Users.query.filter_by(email=email).first()

        if user and check_password_hash(user.password_hash, password):
            session['user_id'] = user.id
            session['username'] = user.username
            session['role'] = user.role
            flash('Login successful!', 'success')
            return redirect(url_for('dashboard'))
        else:
            flash('Invalid credentials!', 'danger')

    return render_template('login.html')

# Route untuk logout user
@app.route('/logout')
def logout():
    session.clear()
    flash('You have been logged out.', 'info')
    return redirect(url_for('login'))

# Route untuk dashboard
@app.route('/dashboard')
def dashboard():
    if 'user_id' not in session:
        flash('Please log in to access this page.', 'warning')
        return redirect(url_for('login'))

    all_users = Users.query.all()  
    return render_template('dashboard.html', users=all_users)

# Route untuk menghapus user
@app.route('/delete/<int:id>')
def delete_user(id):
    if 'user_id' not in session:
        flash('Please log in to access this page.', 'warning')
        return redirect(url_for('login'))

    user = Users.query.get_or_404(id)
    try:
        db.session.delete(user)
        db.session.commit()
        flash('User deleted successfully.', 'success')
    except Exception as e:
        flash(f'Error occurred: {e}', 'danger')

    return redirect(url_for('dashboard'))

# Route untuk edit user
@app.route('/edit/<int:id>', methods=['GET', 'POST'])
def edit_user(id):
    if 'user_id' not in session:
        flash('Please log in to access this page.', 'warning')
        return redirect(url_for('login'))

    user = Users.query.get_or_404(id)

    if request.method == 'POST':
        user.username = request.form['username']
        user.email = request.form['email']
        user.role = request.form.get('role', 'user')

        try:
            db.session.commit()
            flash('User updated successfully.', 'success')
            return redirect(url_for('dashboard'))
        except Exception as e:
            flash(f'Error occurred: {e}', 'danger')

    return render_template('edit.html', user=user)

if __name__ == '__main__':
    app.run(debug=True)
