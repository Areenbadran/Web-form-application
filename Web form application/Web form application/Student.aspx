<%@ Page Title="Student Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Student.aspx.cs" Inherits="Web_form_application.Student" EnableEventValidation="false" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">
      <form>
        <h2>Student Information</h2>
        <br/>
        <!--  row START   -->
        <div class="row">
            <!--  col-sm-4 START -->
            <div class="col-sm-4">
            <div class="form-group">
                <label>Full Name</label>
                <asp:TextBox ID="txtStudentName"  runat="server" placeholder="Student Name" CssClass="form-control"></asp:TextBox>
            </div>
            </div>
            <!--  col-sm-4 END -->

            <!--  col-sm-4 START -->
            <div class="col-sm-4">
            <div class="form-group">
                <label>Gender</label>
                <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-control">
                    <asp:ListItem Text="Female" Value="1"></asp:ListItem>
                    <asp:ListItem Text="Male" Value="2"></asp:ListItem>
                </asp:DropDownList>
            </div>
            </div>
            <!--  col-sm-4 END -->

              <!--  col-sm-4 START -->
            <div class="col-sm-4">
             <div class="form-group">
                <label>Birth Date</label>
                <asp:TextBox ID="txtDate" runat="server" TextMode="Date" CssClass="form-control" placeholder="Choose a date"></asp:TextBox>                                              
            </div>
            </div>
            <!--  col-sm-4 END -->

        </div>
         <!--  row END   -->

    
        <!--  row START   -->
        <div class="row">
            <!--  col-sm-4 START -->
            <div class="col-sm-4">
            <div class="form-group">
                <label>Number of Kids</label>
                <asp:TextBox ID="txtNumber" runat="server" TextMode="Number" placeholder="Number" CssClass="form-control"></asp:TextBox>   
            </div>
            </div>
            <!--  col-sm-4 END -->

            <!--  col-sm-4 START -->      
            <div class="col-sm-4">
            <div class="form-group">
                <label>How do you hear about us?</label>
                <asp:DropDownList ID="ddlInfo" runat="server" CssClass="form-control">
                    <asp:ListItem Text="Google" Value="1"></asp:ListItem>
                    <asp:ListItem Text="TV" Value="2"></asp:ListItem>
                    <asp:ListItem Text="Radio" Value="3"></asp:ListItem>
                    <asp:ListItem Text="Social Natwork" Value="4"></asp:ListItem>
                </asp:DropDownList> 
            </div>
            </div>
            <!--  col-sm-4 END -->

            <!--  col-sm-4 START -->      
            <div class="col-sm-4">
            <div class="form-group">
            </div>
            </div>
            <!--  col-sm-4 END -->      

        </div>
         <!--  row END   -->



      <!--  row START   -->      
        <div class="row">
            <!--  col-sm-4 START -->              
            <div class="col-sm-4">
            <div class="form-group">
                <%--<asp:Button ID="btnStudentUpdate" runat="server" Text="Update" CssClass="btn btn-primary" Enabled="False" OnClick="btnStudentUpdate_Click"/>--%>
                <asp:Button ID="btnStudentSave" runat="server" Text="Save" CssClass="btn btn-primary" OnClick="btnStudentSave_Click" />
            </div>
            </div>
            <!--  col-sm-4 END -->  

        </div>
        <!--  row END   --> 


        <h2>Student Search by name</h2>
        <br/>
        <!--  row START   -->
        <div class="row">
            <!--  col-sm-4 START -->
            <div class="col-sm-4">
            <div class="form-group">
                <asp:TextBox ID="txtSearch"  runat="server" placeholder="Student Name" CssClass="form-control"></asp:TextBox>
            </div>
            </div>
         </div>
         <div class="row">
            <!--  col-sm-4 START -->
            <div class="col-sm-4">
            <div class="form-group">
                <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-primary" OnClick="btnSearch_Click" />
            </div>
            </div>
         </div>
 
          
        <!-- Students Table START -->
        <div>
          <h2>Students List</h2>
          <br/>
           <asp:GridView ID="gvStudents" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" 
               BorderStyle="None" BorderWidth="1px" CellPadding="4" ShowCheckBox="True" ForeColor="Black" GridLines="Vertical" Width="1125px" 
               Height="126px" OnRowDataBound="gvStudents_RowDataBound" OnSelectedIndexChanging="gvStudents_SelectedIndexChanging"  DataKeyNames="StudentID">
               <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="Name" HeaderText ="Student Name" />
                <asp:BoundField DataField="Date" HeaderText ="Birth Date" />
                <asp:BoundField DataField="Kids" HeaderText ="Number of kids" />
                <asp:TemplateField HeaderText ="Gender">
                    <ItemTemplate>
                        <asp:Label ID="lblGender" runat="server" Text='<%# Bind("Gender") %>'></asp:Label>
                    </ItemTemplate>                 
                </asp:TemplateField>            
                 <asp:TemplateField HeaderText ="Knowing us via">
                    <ItemTemplate>
                        <asp:Label ID="lblInfo" runat="server" Text='<%# Bind("Info") %>'></asp:Label>
                    </ItemTemplate>                 
                </asp:TemplateField>
                


<%--                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkEdit" Text="Edit" runat="server" CommandArgument='<%# Eval("StudentID") %>' OnClick="lnkEdit_Click" CausesValidation="false"/>
                    </ItemTemplate>                 
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkDelete" Text="Delete" runat="server" CommandArgument='<%# Eval("StudentID") %>' OnClick="lnkDelete_Click" CausesValidation="false"/>
                    </ItemTemplate>
                </asp:TemplateField>--%>
            </Columns>
               <FooterStyle BackColor="#CCCC99" />
               <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
               <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
               <RowStyle BackColor="#F7F7DE" />
               <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
               <SortedAscendingCellStyle BackColor="#FBFBF2" />
               <SortedAscendingHeaderStyle BackColor="#848384" />
               <SortedDescendingCellStyle BackColor="#EAEAD3" />
               <SortedDescendingHeaderStyle BackColor="#575357" />
           </asp:GridView>
        </div>  
        <!-- Students Table END -->

        </form>
    </div> 
       

</asp:Content>
