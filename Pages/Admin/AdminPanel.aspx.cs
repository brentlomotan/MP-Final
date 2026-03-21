using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing.Printing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

namespace GROUP01_MP_Mockup.Pages.Admin
{
    public partial class AdminPanel : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["MainDB"].ConnectionString;
        DataTable PendingUsers = new DataTable();
        DataTable Projects = new DataTable();
        DataTable Announcements = new DataTable();

        void LoadPendingUsers()
        {
            using (SqlConnection con = new SqlConnection(connStr))
            {
                using (SqlDataAdapter adapter = new SqlDataAdapter("SELECT UserID, FirstName, LastName, UserBarangay, UserAddress, DateRegistered FROM UserProfile WHERE ApprovalStatus = \'Pending\' ORDER BY DateRegistered ASC", con))
                {
                    con.Open();
                    adapter.Fill(PendingUsers);
                    con.Close();
                }

                PendingSet.DataSource = PendingUsers;
                PendingSet.DataBind();
                con.Close();
            }
        }

        void LoadProjects()
        {
            using (SqlConnection con = new SqlConnection(connStr))
            {
                using (SqlDataAdapter adapter = new SqlDataAdapter("SELECT ProjectID, UserID, Title, Description, Category, Progress, Status FROM Projects", con))
                {
                    con.Open();
                    adapter.Fill(Projects);
                    con.Close();
                }

                ProjectsRepeater.DataSource = Projects;
                ProjectsRepeater.DataBind();
                con.Close();
            }
        }

        void LoadAnnouncements()
        {
            using (SqlConnection con = new SqlConnection(connStr))
            {
                using (SqlDataAdapter adapter = new SqlDataAdapter("SELECT AnnouncementID, UserID, Title, Description, Category FROM Announcements", con))
                {
                    con.Open();
                    adapter.Fill(Announcements);
                    con.Close();
                }

                AnnouncementsRepeater.DataSource = Announcements;
                AnnouncementsRepeater.DataBind();
                con.Close();
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadPendingUsers();
                LoadProjects();
                LoadAnnouncements();
            }
        }

        protected void Accept_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            using (SqlConnection con = new SqlConnection(connStr))
            {
                using (SqlCommand cmd = new SqlCommand("UPDATE UserProfile SET ApprovalStatus = \'Approved\' WHERE UserID = @SelectedID", con))
                {
                    con.Open();
                    try
                    {
                        cmd.Parameters.AddWithValue("@SelectedID", btn.CommandArgument);
                        cmd.ExecuteNonQuery();
                        pnlNotification.Visible = true;
                        litMessage.Text = "Succesfully accepted user!";
                        LoadPendingUsers();

                    } catch (Exception ex)
                    {
                        litMessage.Text = ex.ToString();
                        pnlNotification.Visible = true;
                    }
                }
            }
        }

        protected void Reject_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            using (SqlConnection con = new SqlConnection(connStr))
            {
                using (SqlCommand cmd = new SqlCommand("UPDATE UserProfile SET ApprovalStatus = \'Rejected\' WHERE UserID = @SelectedID", con))
                {
                    con.Open();
                    try
                    {
                        cmd.Parameters.AddWithValue("@SelectedID", btn.CommandArgument);
                        cmd.ExecuteNonQuery();
                        pnlNotification.Visible = true;
                        litMessage.Text = "Succesfully rejected user!";
                        LoadPendingUsers();

                    }
                    catch (Exception ex)
                    {
                        litMessage.Text = ex.ToString();
                        pnlNotification.Visible = true;
                    }
                }
            }
        }

        protected void btnNotifClose_Click(object sender, EventArgs e)
        {
            pnlNotification.Visible = false;
        }

        protected void ShowProjectEdit(object sender, EventArgs e) //TBA
        {
            pnlNotification.Visible = true;
        }

        protected void btnAddNewProject_Click(object sender, EventArgs e) //TBA
        {

        }

        protected void btnAddNewAnnouncement_Click(object sender, EventArgs e) //TBA
        {

        }

        protected void ShowAnnouncementEdit(object sender, EventArgs e)
        {
            pnlNotification.Visible = true;
        }

    }
}