Add-Type -assembly System.Windows.Forms
Add-Type -AssemblyName PresentationFramework
## -- Create The Progress-Bar
$ObjForm = New-Object System.Windows.Forms.Form
$ObjForm.Text = "Install Interface."
$ObjForm.BackColor = "White"
$ObjForm.Width = 400
$ObjForm.Height = 150
$ObjForm.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedSingle
$ObjForm.StartPosition = [System.Windows.Forms.FormStartPosition]::CenterScreen

## -- Create The Label
$ObjLabel = New-Object System.Windows.Forms.Label
$ObjLabel.Text = "Downloading python. Please wait ... "
$ObjLabel.Left = 5
$ObjLabel.Top = 10
$ObjLabel.Width = 500 - 20
$ObjLabel.Height = 15
$ObjLabel.Font = "Tahoma"
## -- Add the label to the Form
$ObjForm.Controls.Add($ObjLabel)

$PB = New-Object System.Windows.Forms.ProgressBar
$PB.Name = "PowerShellProgressBar"
$PB.Value = 0
$PB.Style="Continuous"

$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Width = 300
$System_Drawing_Size.Height = 20
$PB.Size = $System_Drawing_Size
$PB.Left = 50
$PB.Top = 40
$ObjForm.Controls.Add($PB)

## -- Show the Progress-Bar and Start The PowerShell Script
$ObjForm.Show() | Out-Null
$ObjForm.Focus() | Out-NUll
$ObjLabel.Text = "Downloading python. Please wait ... "
$ObjForm.Refresh()

Start-Sleep -Seconds 1

$PB.Value = 10
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$PB.Value = 20
Invoke-WebRequest -Uri "https://www.python.org/ftp/python/3.7.0/python-3.7.0.exe" -OutFile "python-3.7.0.exe"
$PB.Value = 50
$ObjLabel.Text = "Installing python. Please wait ... "
./python-3.7.0.exe /passive InstallAllUsers=0 PrependPath=1 Include_test=0 
Start-Sleep -s 15
$PB.Value = 55
Start-Sleep -s 15
$PB.Value = 60
$ObjLabel.Text = "Downloading update. Please wait ... "
Start-Sleep -s 15
$PB.Value = 65
$ObjLabel.Text = "Installing update. Please wait ... "
Start-Sleep -s 15
$PB.Value = 70
$ObjLabel.Text = "Reorganising libraries. Please wait ... "
Start-Sleep -s 15
$PB.Value = 80
py -m pip install keyboard
$PB.Value = 90
py updater.py
$PB.Value = 100
$ObjForm.close()
$ObjLabel.Text = "Installation Complete. Exiting... "
Write-Host "`n"
[System.Windows.MessageBox]::Show('HotDocs Sidebar successfully updated.')