<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddNew.aspx.cs" Inherits="DATrackingWeb.AddNew" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-md-12">
            <h2 class="col-md-3 col-xs-12">เพิ่มข้อมูลครุภัณฑ์</h2>
        </div>
    </div>
    <div class="row form-horizontal">
        <div class="form-group">
            <label for="keyword" class="control-label col-md-2">รหัสครุภัณฑ์</label>
            <div class="col-md-9">
                <div class="input-group">
                    <input type="text" id="txtItemID" class="form-control" placeholder="ตรวจสอบครุภัณฑ์ด้วยรหัสเช่น CC/66-2-01/59" runat="server">
                    <span class="input-group-btn">
                        <button runat="server" id="btnItemidCheck" class="btn btn-primary" type="button" onserverclick="btnItemidCheck_ServerClick" >Continue</button>
                    </span>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-12" visible="false" runat="server" id="alertDupplicated">
        <div class="alert alert-danger alert-dismissible" role="alert" runat="server">
                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <strong>รหัสครุภัณฑ์ไม่ถูกต้อง!</strong> ไม่สามารถเพิ่มรหัสครุภัณฑ์นี้ได้ เนื่องจากมีรหัสครุภัณฑ์ 
                <a runat="server" id="linkDuplicated" href="~/Item?itemid=" class="alert-link"></a> ในฐานข้อมูลแล้ว
        </div>
    </div>
    <div class="container col-md-12"  runat="server" id="panelInsert" visible="false">
        <div class="row">
            <asp:DetailsView ID="dvItemDetail" runat="server" CssClass="table col-md-12" AutoGenerateRows="False" GridLines="None" DefaultMode="Insert" OnItemInserting="dvItemDetail_ItemInserting">
                <Fields>
                   <asp:TemplateField HeaderText="รหัสครุภัณฑ์">                        
                        <InsertItemTemplate>
                            <asp:TextBox ID="txtNewItemID" runat="server" CssClass="form-control" Text='<%# Bind("ItemID") %>' ReadOnly="true"></asp:TextBox>
                        </InsertItemTemplate>                       
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="คำอธิบาย">
                        <HeaderStyle CssClass="col-md-2" />
                        <ItemStyle CssClass="col-md-10" />
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" Text='<%# Bind("Desciption") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" Text='<%# Bind("Desciption") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("Desciption") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="ปีงบประมาณ">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control" Text='<%# Bind("FiscalYear") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control" Text='<%# Bind("FiscalYear") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("FiscalYear") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="แหล่งเงิน">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control" Text='<%# Bind("BudgetSource") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control" Text='<%# Bind("BudgetSource") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("BudgetSource") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="ราคา">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox13" runat="server" CssClass="form-control" Text='<%# Bind("Price") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox13" runat="server" CssClass="form-control" Text='<%# Bind("Price") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label13" runat="server" Text='<%# Bind("Price") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="กลุ่ม">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox7" runat="server" CssClass="form-control" Text='<%# Bind("Group1") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox7" runat="server" CssClass="form-control" Text='<%# Bind("Group1") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("Group1") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="ประเภท 1">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox5" runat="server" CssClass="form-control" Text='<%# Bind("DAType1") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox5" runat="server" CssClass="form-control" Text='<%# Bind("DAType1") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("DAType1") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="ประเภท 2">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox6" runat="server" CssClass="form-control" Text='<%# Bind("DAType2") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox6" runat="server" CssClass="form-control" Text='<%# Bind("DAType2") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("DAType2") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="วันที่รับเข้า">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox9" runat="server" CssClass="form-control" Text='<%# Bind("CheckInDate") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox9" runat="server" CssClass="form-control" Text='<%# Bind("CheckInDate") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label9" runat="server" Text='<%# Bind("CheckInDate") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="ผู้จัดจำหน่าย">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox8" runat="server" CssClass="form-control" Text='<%# Bind("SupplierName") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox8" runat="server" CssClass="form-control" Text='<%# Bind("SupplierName") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label8" runat="server" Text='<%# Bind("SupplierName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="ปีรับประกัน">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox10" runat="server" CssClass="form-control" Text='<%# Bind("WarrantyYear") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox10" runat="server" CssClass="form-control" Text='<%# Bind("WarrantyYear") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label10" runat="server" Text='<%# Bind("WarrantyYear") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="วันหมดประกัน">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox11" runat="server" CssClass="form-control" Text='<%# Bind("WarrantyExpiredDate") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox11" runat="server" CssClass="form-control" Text='<%# Bind("WarrantyExpiredDate") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label11" runat="server" Text='<%# Bind("WarrantyExpiredDate") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="หมายเหตุ">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox12" runat="server" CssClass="form-control" Text='<%# Bind("AdditionalDetail") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox12" runat="server" CssClass="form-control" Text='<%# Bind("AdditionalDetail") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label12" runat="server" Text='<%# Bind("AdditionalDetail") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <EditItemTemplate>
                            <asp:Button ID="Button1" runat="server" CausesValidation="True" CommandName="Update" CssClass="btn btn-primary" Text="Save" />
                            &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Cancel" CssClass="btn btn-default" Text="Cancel" />
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:Button ID="Button1" runat="server" CausesValidation="True" CommandName="Insert" CssClass="btn btn-primary" Text="Insert" />
                            &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Cancel" CssClass="btn btn-default" Text="Cancel" />
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Edit" CssClass="btn btn-primary" Text="Edit" />
                            &nbsp;&nbsp;<asp:Button ID="Button3" runat="server" CausesValidation="False" CommandName="Delete" CssClass="btn btn-danger" Text="Delete" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Fields>
            </asp:DetailsView>
        </div>
    </div>
    <div class="row" runat="server" id="panelSuccess" visible="false">
        <div class="alert alert-success" role="alert">
           บันทึกข้อมูลครุภัณฑ์ <a runat="server" id="linkNewItemID" href="~/Item?itemid=" class="alert-link"></a> เรียบร้อยแล้ว
        </div>
    </div>
</asp:Content>
