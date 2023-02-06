#nested object for employee data

$employee = @{
    
    Name = "Ankit"
    LastName = "Gupta"
    Age  = "25"
    Department = "HR"

    Address = @{

        House_no ="A2"
        Block = "A"
        Area = "Saket"
        State = "Delhi"
        Pincode = "110063"
    
    }
}


function Get-EmployeeInfo {

    param(
    [Parameter(Mandatory,position=0)]
    [object]$employee,

    [Parameter(Mandatory,position=1)]
    [string]$Name
  )


  # Access properties of the employee object
  $name = $Employee.Name
  $lastName = $Employee.LastName
  $age = $Employee.Age
  $department = $Employee.Department

  # Access properties of the address object
  $houseNo = $Employee.Address.House_no
  $block = $Employee.Address.Block
  $area = $Employee.Address.Area
  $state = $Employee.Address.State
  $pincode = $Employee.Address.Pincode

  # Return a new object with the extracted information
  [PSCustomObject]@{
    Name = $name
    LastName = $lastName
    Age = $age
    Department = $department
    HouseNo = $houseNo
    Block = $block
    Area = $area
    State = $state
    Pincode = $pincode
  }

}

$value = Get-EmployeeInfo -employee $employee -Name $employee.Name
Write-Output $value


