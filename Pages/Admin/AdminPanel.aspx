<%@ Page Title="Admin Panel" Language="C#" MasterPageFile="~/MasterPages/Site.Master" AutoEventWireup="true" CodeBehind="AdminPanel.aspx.cs" Inherits="GROUP01_MP_Mockup.Pages.Admin.AdminPanel"%>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <style>
    main {
        margin-top: 0;
        position: relative;
        z-index: 1;
        background: #AED3EF;
        min-height: 100vh;

        width: calc(100% + 60px);
        margin-left: -30px;
    }

    .footer {
        display: none !important;
    }

    .container{
        display: flex;
        justify-content: center;
        align-content: center;
        width: 100vw;
    }

    .container2{
        margin-top: 150px;
        display: flex;
        justify-content: center;
        align-content: center;
        width: 100vw;
    }

    .container3{
        margin-top: 150px;
        display: flex;
        justify-content: center;
        align-content: center;
        width: 100vw;
    }

    .card {
        background-color: #46a4c7;
        box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
        transition: 0.3s;
        width: 85vw;
        box-sizing: border-box;
        border-radius: 7px;
        animation: fadeUp 0.6s ease both;
    }

    .card:hover {
        box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
    }

    .table-div {
        width: 85vw;
        justify-content: center;
        overflow-x: auto;
    }

    .approval-table{
        width: 100%;
        border-collapse: collapse;
        position: relative;
        margin-bottom: 15px;
    }

    .approval-table th {
        text-align: left;
        padding-left: 20px;
        border-bottom: 2px solid rgba(255,255,255,0.3);
        font-weight: bold;
        font-size: 20px;
        padding-bottom: 15px;
        color: #162732;
    }

    .approval-table td {
        padding: 5px;
        padding-left: 20px;
        color: #162732;
    }

    .btn-accept, .btn-reject {
        padding: 5px 10px;
        cursor: pointer;
        border-radius: 5px;
        border: 1px solid #ccc;
        font-weight: bold;
        transition: 0.3s;
    }

    .btn-accept:hover{
        background-color: #f0f0f0;
        color: #608853;
        transform: scale(1.05);
    }
    .btn-reject:hover{
        background-color: #f0f0f0;
        color: #f25b6a;
        transform: scale(1.05);
    }

    .modal-overlay {
        position: fixed;
        top: 0;
        left: 0;
        width: 100vw;
        height: 100vh;
        z-index: 9999; 
        display: flex;
        justify-content: center;
        align-items: flex-end;
        padding-bottom: 50px;
    }

    .modal-box {
        background: white;
        border-radius: 8px;
        box-shadow: 0 5px 15px rgba(0,0,0,0.3);
        text-align: center;
        justify-content: center;
        min-width: 17vw;
        min-height: 5vh;
        color: #333;
        animation: fadeUp 0.6s;
    }

    .modal-inline {
        margin-top: 8px;
        display: flex;
        align-items: center; 
        justify-content: center; 
        gap: 15px; 
    }

    .modal-inline p {
        margin: 0;
    }

    .btn-ok {
        padding: 8px 20px;
        background-color: #46a3c3;
        color: white;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }

    .Card2Header{
        display: flex;
        justify-content: space-between;
        align-items: center;
        position: relative;
    }

    .Card3Header{
        display: flex;
        justify-content: space-between;
        align-items: center;
        position: relative;
    }

    .btn-add-project {
        position: absolute;
        top: 20px;    
        right: 25px;    
        padding: 10px 20px;
        background-color: white;
        color: #46a3c3; 
        border: none;
        border-radius: 5px;
        font-weight: bold;
        cursor: pointer;
        box-shadow: 0 2px 5px rgba(0,0,0,0.2);
        transition: 0.3s;
    }

    .btn-add-project:hover {
        background-color: #f0f0f0;
        transform: scale(1.05);
    }

    .ProjectCard{
        background: #46a4c7;
        border-radius: 2px;
        padding: 2px;
    }

    .ProjectCard:hover{
        background: rgba(52, 121, 147, 0.3);
    }

    .h3{
        color: #162732;
        padding-left: 20px;
        text-decoration: none;
        font-size: 28px;
    }

    .h4{
        color: #162732;
        padding-left: 20px;
        text-decoration: none;
    }

    .h5{
        color: #162732;
        padding-left: 20px;
        text-decoration: none;
    }

    @keyframes fadeUp {
        from { opacity: 0; transform: translateY(16px); }
        to   { opacity: 1; transform: translateY(0); }
    }
</style>

<main>
    <div class="container">
        <div class="card">
            <h1 style="color: white; padding-left: 20px; margin-bottom: 20px; font-size: 32px;">Pending Accounts</h1>
            <div class="table-div">
                <table class="approval-table">
                    <thead>
                    <tr>
                        <th>UserID</th>
                        <th>Full Name</th>
                        <th>Barangay Code</th>
                        <th>Address</th>
                        <th>Date Registered</th>
                        <th>Actions</th>
                    </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="PendingSet" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td><%# Eval("UserID") %></td>
                                <td><%# Eval("FirstName") %> <%# Eval("LastName") %></td>
                                <td><%# Eval("UserBarangay") %></td>
                                <td><%# Eval("UserAddress") %></td>
                                <td><%# Eval("DateRegistered", "{0:MMM dd, yyyy}") %></td>
                                <td>
                                    <asp:Button ID="btnAccept" runat="server" Text="Accept" CommandArgument='<%# Eval("UserID") %>' OnClick="Accept_Click" CssClass="btn-accept" />
                                    <asp:Button ID="btnReject" runat="server" Text="Reject" CommandArgument='<%# Eval("UserID") %>' OnClick="Reject_Click" CssClass="btn-reject" />
                                </td>
                            </tr>
                        </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>
            </div>
        </div>    
    </div>
    <div class="container2">
        <div class="card">
            <div class="Card2Header">
                <h1 style="color: white; padding-left: 20px; margin-bottom: 20px; font-size: 32px;">Manage Projects</h1>
                <asp:Button ID="btnAddNewProject" runat="server" Text="Add New Project" CssClass="btn-add-project" OnClick="btnAddNewProject_Click" />
            </div>
            <asp:Repeater ID="ProjectsRepeater" runat="server">
                <ItemTemplate>
                    <div class="ProjectCard" onclick="this.querySelector('.hidden-trigger').click();">
                        <div class="TextHolder"> 
                            <h3 class="h3"><%# Eval("Title") %></h3>
                            <h4 class="h4">Category: <%# Eval("Category") %></h4>
                            <h5 class="h5">Published by: <%# Eval("UserID")%></h5>
                        </div>

                        <asp:Button ID="btnHidden" CssClass="hidden-trigger" runat="server" style="display:none;" CommandArgument='<%# Eval("ProjectID") %>' OnClick="ShowProjectEdit" />
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
    <div class="container3">
        <div class="card">
        <div class="Card3Header">
            <h1 style="color: white; padding-left: 20px; margin-bottom: 20px; font-size: 32px;">Manage Announcements</h1>
            <asp:Button ID="btnAddNewAnnouncement" runat="server" Text="Add New Announcement" CssClass="btn-add-project" OnClick="btnAddNewAnnouncement_Click" />
        </div>
        <asp:Repeater ID="AnnouncementsRepeater" runat="server">
            <ItemTemplate>
                <div class="ProjectCard" onclick="this.querySelector('.hidden-trigger').click();">
                    <div class="TextHolder">
                        <h3 class="h3"><%# Eval("Title") %></h3>
                        <h4 class="h4">Category: <%# Eval("Category") %></h4>
                        <h5 class="h5">Published by: <%# Eval("UserID")%></h5>
                    </div>

                     <asp:Button ID="btnHidden" CssClass="hidden-trigger" runat="server" style="display:none;" CommandArgument='<%# Eval("AnnouncementID") %>' OnClick="ShowAnnouncementEdit" />
                </div>
            </ItemTemplate>
        </asp:Repeater>
        </div>
    </div>

    <asp:Panel ID="pnlNotification" runat="server" Visible="false" CssClass="modal-overlay">
        <div class="modal-box">
            <div class="modal-inline">
            <p><asp:Literal ID="litMessage" runat="server"></asp:Literal></p> 
            <asp:Button ID="btnClose" runat="server" Text="OK" OnClick="btnNotifClose_Click" CssClass="btn-ok" />
            </div>
        </div>
    </asp:Panel>

</main>
</asp:Content>