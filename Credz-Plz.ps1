# Importar el módulo Windows Forms
Add-Type -AssemblyName System.Windows.Forms

# Crear el formulario principal
$form = New-Object System.Windows.Forms.Form
$form.Text = "Windows Security"
$form.Size = New-Object System.Drawing.Size(300,200)
$form.StartPosition = "CenterScreen"
$form.BackColor = "Gray"

# Crear el campo de usuario
$userLabel = New-Object System.Windows.Forms.Label
$userLabel.Text = "User name"
$userLabel.Location = New-Object System.Drawing.Point(10,10)
$userLabel.AutoSize = $true
$userLabel.ForeColor = "White"
$form.Controls.Add($userLabel)

$userBox = New-Object System.Windows.Forms.TextBox
$userBox.Location = New-Object System.Drawing.Point(80,10)
$userBox.Size = New-Object System.Drawing.Size(200,20)
$form.Controls.Add($userBox)

# Crear el campo de contraseña
$passwordLabel = New-Object System.Windows.Forms.Label
$passwordLabel.Text = "Password"
$passwordLabel.Location = New-Object System.Drawing.Point(10,40)
$passwordLabel.AutoSize = $true
$passwordLabel.ForeColor = "White"
$form.Controls.Add($passwordLabel)

$passwordBox = New-Object System.Windows.Forms.TextBox
$passwordBox.Location = New-Object System.Drawing.Point(80,40)
$passwordBox.Size = New-Object System.Drawing.Size(200,20)
$passwordBox.UseSystemPasswordChar = $true
$form.Controls.Add($passwordBox)

# Crear el enlace de más opciones
$moreLink = New-Object System.Windows.Forms.LinkLabel
$moreLink.Text = "More choices"
$moreLink.Location = New-Object System.Drawing.Point(10,70)
$moreLink.AutoSize = $true
$moreLink.LinkColor = "White"
$form.Controls.Add($moreLink)

# Crear el botón de OK
$okButton = New-Object System.Windows.Forms.Button
$okButton.Text = "OK"
$okButton.Location = New-Object System.Drawing.Point(100,120)
$okButton.Size = New-Object System.Drawing.Size(80,30)
$form.Controls.Add($okButton)

# Crear el botón de Cancel
$cancelButton = New-Object System.Windows.Forms.Button
$cancelButton.Text = "Cancel"
$cancelButton.Location = New-Object System.Drawing.Point(200,120)
$cancelButton.Size = New-Object System.Drawing.Size(80,30)
$form.Controls.Add($cancelButton)

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

# Añadir un evento al botón de OK para que se ejecute cuando se haga clic
$okButton.Add_Click({
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

# Añadir un evento al botón de Cancel para que se cierre el formulario
$cancelButton.Add_Click({
    $form.Close()
})

# Añadir un evento al enlace de más opciones para que se abra una nueva ventana con otras opciones
$moreLink.Add_Click({
    # Crear una nueva ventana con un listado de opciones
    $optionsForm = New-Object System.Windows.Forms.Form
    $optionsForm.Text = "More choices"
    $optionsForm.Size = New-Object System.Drawing.Size(300,200)
    $optionsForm.StartPosition = "CenterScreen"
    $optionsForm.BackColor = "Gray"

    # Crear un control de lista con las opciones disponibles
    $optionsList = New-Object System.Windows.Forms.ListBox
    $optionsList.Location = New-Object System.Drawing.Point(10,10)
    $optionsList.Size = New-Object System.Drawing.Size(280,150)
    $optionsList.Items.Add("Use a different account")
    $optionsList.Items.Add("Use a smart card")
    $optionsList.Items.Add("Use Windows Hello")
    $optionsForm.Controls.Add($optionsList)

    # Crear un botón de OK para cerrar la ventana de opciones
    $okButton = New-Object System.Windows.Forms.Button
    $okButton.Text = "OK"
    $okButton.Location = New-Object System.Drawing.Point(100,160)
    $okButton.Size = New-Object System.Drawing.Size(80,30)
    $okButton.Add_Click({
        $optionsForm.Close()
    })
    $optionsForm.Controls.Add($okButton)

    # Mostrar la ventana de opciones
    $optionsForm.ShowDialog()
})

# Mostrar el formulario
$form.ShowDialog()
