<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Item.aspx.cs" Inherits="DATrackingWeb.Item" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-md-12">
            <h2 class="col-md-3 col-xs-12">รายละเอียดครุภัณฑ์</h2>
            <h2 class="col-md-9 col-xs-12"><asp:Label ID="lbItemIDHead" runat="server" Text="CC/??" CssClass="well well-sm"></asp:Label></h2>        
        </div>
    </div>
    <div class="container" runat="server" id="panelEdit" visible="true">
        <div class="row">
            <asp:DetailsView ID="dvItemDetail" runat="server" CssClass="table col-md-12" OnModeChanging="dvItemDetail_ModeChanging" AutoGenerateRows="False" GridLines="None" OnItemUpdating="dvItemDetail_ItemUpdating">
                <Fields>
                    <asp:TemplateField HeaderText="รหัส">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" Text='<%# Bind("ItemID") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" Text='<%# Bind("ItemID") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("ItemID") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle CssClass="col-md-2" />
                        <ItemStyle CssClass="col-md-10" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="คำอธิบาย">
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
                            &nbsp;&nbsp;
                            <button runat="server" id="btnConfirmDelete" class="btn btn-danger" type="button" data-toggle="modal" data-target="#confirm-delete">Delete</button>                       
                             </ItemTemplate>
                    </asp:TemplateField>
                </Fields>
            </asp:DetailsView>
        </div>
    </div>
    <div class="row" runat="server" id="panelSuccess" visible="false">
        <div class="alert alert-success alert-dismissible" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <strong>บันทึกข้อมูลเรียบร้อยแล้ว</strong>
        </div>
    </div>
    <div class="row" runat="server" id="panelDeleted" visible="false">
        <div class="alert alert-success alert-dismissible" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <strong>ลบข้อมูลเรียบร้อยแล้ว</strong>
        </div>
    </div>
    <div class="modal fade" id="confirm-delete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">Confirm</h4>
                </div>
                <div class="modal-body">
                    <p>ต้องการลบข้อมูลครุภัณฑ์นี้ ?</p>
                    <p>คลิก Yes เพื่อยืนยันการลบข้อมูล</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
                    <asp:Button ID="btnYes" runat="server" CssClass="btn btn-danger btn-ok" Text="Yes" OnClick="btnYes_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
