<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="DATrackingWeb._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>ระบบตรวจติดตามครุภัณฑ์</h1>
        <p class="lead">ระบบตรวจสอบและติดตามสถานะครุภัณฑ์ ศูนย์คอมพิวเตอร์ มหาวิทยาลัยสงขลานครินทร์ วิทยาเขตหาดใหญ่</p>
        <div class="row">
            <div class="col-md-12">
                <div class="input-group">
                    <input type="text" class="form-control" id="keyword" placeholder="ค้นหาครุภัณฑ์ด้วยรหัสเช่น CC/66-2-01/59" >
                    <span class="input-group-btn">
                                    <button class="btn btn-danger" type="button">
                                        <span class=" glyphicon glyphicon-search"></span>
                                    </button>
                    </span>
                </div>
                <!-- /input-group -->
            </div>
            <!-- /.col-lg-12 -->
        </div>
    </div>
     <a class="btn btn-default" href="http://zxing.appspot.com/scan?ret=http%3A%2F%2Flocalhost%3A50078%2FSearch.aspx%3Fid%3D%7BCODE%7D">SCAN &raquo;</a>
    <div class="row">
        <div class="col-md-4">
            <h2>Search</h2>
            <p>
                ASP.NET Web Forms lets you build dynamic websites using a familiar drag-and-drop, event-driven model.
            A design surface and hundreds of controls and components let you rapidly build sophisticated, powerful UI-driven sites with data access.
            </p>
            <p>
                <a class="btn btn-default" runat="server" href="~/Search">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Add New Item</h2>
            <p>
                NuGet is a free Visual Studio extension that makes it easy to add, remove, and update libraries and tools in Visual Studio projects.
            </p>
            <p>
                <a class="btn btn-default" runat="server" href="~/AddNew">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Import Data</h2>
            <p>
                You can easily find a web hosting company that offers the right mix of features and price for your applications.
            </p>
            <p>
                <a class="btn btn-default" href="~/Import">Learn more &raquo;</a>
            </p>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4">
            <h2>Reports</h2>
            <p>
                ASP.NET Web Forms lets you build dynamic websites using a familiar drag-and-drop, event-driven model.
            A design surface and hundreds of controls and components let you rapidly build sophisticated, powerful UI-driven sites with data access.
            </p>
            <p>
                <a class="btn btn-default" href="~/Reports">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Tools</h2>
            <p>
                NuGet is a free Visual Studio extension that makes it easy to add, remove, and update libraries and tools in Visual Studio projects.
            </p>
            <p>
                <a class="btn btn-default" href="~/Tools">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Settings</h2>
            <p>
                You can easily find a web hosting company that offers the right mix of features and price for your applications.
            </p>
            <p>
                <a class="btn btn-default" href="~/Settings">Learn more &raquo;</a>
            </p>
        </div>
    </div>

</asp:Content>
