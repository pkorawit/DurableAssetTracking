<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="DATrackingWeb.Search" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        $(document).ready(function (e) {
            $('.search-panel .dropdown-menu').find('a').click(function (e) {
                e.preventDefault();
                var param = $(this).attr("href").replace("#", "");
                var concept = $(this).text();
                $('.search-panel span#search_concept').text(concept);
                $('.input-group #search_param').val(param);
            });
        });
    </script>
    <div class="row">
        <div class="col-md-6">
            <h2>ค้นหาครุภัณฑ์</h2>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-xs-12 col-xs-offset-2">
                <div class="input-group">
                    <div class="input-group-btn search-panel">
                        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                            <span id="search_concept">ค้นหาโดยระบุ</span> <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu" role="menu">
                            <li aria-selected="true"><a href="#contains">รหัส</a></li>
                            <li><a href="#its_equal">คำอธิบาย</a></li>
                            <li><a href="#greather_than">สถานที่</a></li>
                            <li><a href="#less_than">ผู้รับผิดชอบ</a></li>
                            <li><a href="#all">สถานะ</a></li>
                        </ul>
                    </div>
                    <input type="hidden" name="search_param" value="all" id="search_param">
                    <input type="text" class="form-control" name="search_keyword" placeholder="Search term...">
                    <span class="input-group-btn">
                        <button class="btn btn-default" type="submit"><span class="glyphicon glyphicon-search"></span></button>
                    </span>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <asp:GridView ID="gvSearchResult" runat="server" CssClass="table" AutoGenerateColumns="False" Width="100%">
                    <Columns>
                        <asp:HyperLinkField DataTextField="ItemID" HeaderText="รหัส" DataNavigateUrlFields="ItemID" DataNavigateUrlFormatString="Item?itemid={0}" />
                        <asp:BoundField DataField="Desciption" HeaderText="คำอธิบาย" />
                        <asp:BoundField DataField="FiscalYear" HeaderText="ปีงบประมาณ" />
                        <asp:BoundField DataField="BudgetSource" HeaderText="แหล่งเงิน" />
                        <asp:BoundField DataField="DAType1" HeaderText="ประเภท" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
