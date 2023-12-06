# Importar el módulo Windows Forms
Add-Type -AssemblyName System.Windows.Forms

# Crear el formulario principal
$form = New-Object System.Windows.Forms.Form
$form.Text = "Iniciar sesión"
$form.Size = New-Object System.Drawing.Size(300,200)
$form.StartPosition = "CenterScreen"

# Crear el campo de usuario
$userLabel = New-Object System.Windows.Forms.Label
$userLabel.Text = "Usuario:"
$userLabel.Location = New-Object System.Drawing.Point(10,10)
$userLabel.AutoSize = $true
$form.Controls.Add($userLabel)

$userBox = New-Object System.Windows.Forms.TextBox
$userBox.Location = New-Object System.Drawing.Point(80,10)
$userBox.Size = New-Object System.Drawing.Size(200,20)
$form.Controls.Add($userBox)

# Crear el campo de contraseña
$passwordLabel = New-Object System.Windows.Forms.Label
$passwordLabel.Text = "Contraseña:"
$passwordLabel.Location = New-Object System.Drawing.Point(10,40)
$passwordLabel.AutoSize = $true
$form.Controls.Add($passwordLabel)

$passwordBox = New-Object System.Windows.Forms.TextBox
$passwordBox.Location = New-Object System.Drawing.Point(80,40)
$passwordBox.Size = New-Object System.Drawing.Size(200,20)
$passwordBox.UseSystemPasswordChar = $true
$form.Controls.Add($passwordBox)

# Crear el botón de entrar
$enterButton = New-Object System.Windows.Forms.Button
$enterButton.Text = "Entrar"
$enterButton.Location = New-Object System.Drawing.Point(100,80)
$enterButton.Size = New-Object System.Drawing.Size(100,30)
$form.Controls.Add($enterButton)

# Definir una función para validar el usuario y la contraseña
function Validate($user, $password) {
    # Aquí puedes poner la lógica que quieras para comprobar si el usuario y la contraseña son válidos
    # Por ejemplo, puedes usar una lista de usuarios y contraseñas predefinidos, o hacer una llamada a una API
    # En este caso, vamos a usar un usuario y una contraseña fijos para simplificar
    if ($user -eq "admin" -and $password -eq "1234") {
        return $true
    } else {
        return $false
    }
}

# Añadir un evento al botón para que se ejecute cuando se haga clic
$enterButton.Add_Click({
    # Obtener los valores de los campos de usuario y contraseña
    $userValue = $userBox.Text
    $passwordValue = $passwordBox.Text
    # Llamar a la función de validar con los valores obtenidos
    $valid = Validate $userValue $passwordValue
    # Si el resultado es verdadero, mostrar un mensaje de éxito
    # Si el resultado es falso, mostrar un mensaje de error
    if ($valid) {
        [System.Windows.Forms.MessageBox]::Show("Has iniciado sesión correctamente", "Éxito", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Information)
    } else {
        [System.Windows.Forms.MessageBox]::Show("Usuario o contraseña incorrectos", "Error", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)
    }
})

# Mostrar el formulario
$form.ShowDialog()
