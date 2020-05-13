profile "MyProfile"
{
    Caption = 'My Profile';
    Description = 'My Profile';
    RoleCenter = "Order Processor Role Center";
    Customizations = MyCustomization;
}

pagecustomization MyCustomization customizes "Customer List"
{
    layout
    {
        modify("Responsibility Center")
        {
            Visible = false;
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    //Variables, procedures and triggers are not allowed on Page Customizations
}
