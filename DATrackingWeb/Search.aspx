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

    <div class="container">
            <div class="row"> 
        <div class="col-md-12">
            <h2>ค้นหาครุภัณฑ์</h2>
        </div>
    </div>
        <div class="row">
                <div class="input-group col-md-12">
                    <div class="input-group-btn search-panel">
                        <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
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
                    <input id="txtSearch" runat="server" type="text" class="form-control" name="search_keyword" placeholder="Search term...">
                    <span class="input-group-btn">                        
                        <button id="btnSearch" class="btn btn-primary" runat="server" onserverclick="btnSearch_ServerClick"><span class="glyphicon glyphicon-search"></span></button>                        
                    </span>
                </div>
            </div>
        <asp:GridView ID="gvSearchResult" runat="server" CssClass="table table-hover col-md-12" AutoGenerateColumns="False" AllowPaging="True" PageSize="15" OnPageIndexChanged="gvSearchResult_PageIndexChanged" OnPageIndexChanging="gvSearchResult_PageIndexChanging">
                    <Columns>
                        <asp:HyperLinkField DataTextField="ItemID" HeaderText="รหัส" DataNavigateUrlFields="ItemID" DataNavigateUrlFormatString="Item?itemid={0}" />
                        <asp:BoundField DataField="Desciption" HeaderText="คำอธิบาย" />
                        <asp:BoundField DataField="FiscalYear" HeaderText="ปีงบประมาณ" />
                        <asp:BoundField DataField="DAType1" HeaderText="ประเภท" />
                    </Columns>
                    <PagerSettings Mode="NextPrevious" NextPageText="Next &gt;&gt;" PreviousPageText="&lt;&lt; Previous" />
       </asp:GridView>
    </div>
                
</asp:Content>
