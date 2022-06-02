using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Web_form_application
{
    public partial class Student : System.Web.UI.Page
    {
        

        protected void Page_Load(object sender, EventArgs e)
        {
            studentsTable_Display();
        }

        protected void studentsTable_Display()
        {
            SqlConnection conn = new SqlConnection("Data Source=AREEN-BADRAN; Initial Catalog=DB; User Id=Test; Password=Abc123$;");
            SqlCommand cmd = new SqlCommand("select * from Student", conn);
            cmd.Connection = conn;
            try
            {
                conn.Open();
              
                gvStudents.EmptyDataText = "No Records Found";
                gvStudents.DataSource = cmd.ExecuteReader();
                gvStudents.DataBind();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                conn.Close();
                conn.Dispose();
            }

        }

        protected void btnStudentSave_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection("Data Source=AREEN-BADRAN; Initial Catalog=DB; User Id=Test; Password=Abc123$;");
            SqlCommand cmd = new SqlCommand("insert into Student values('" + txtStudentName.Text + "','" + ddlGender.SelectedValue + "','" + txtDate.Text + "','" + txtNumber.Text + "','" + ddlInfo.SelectedValue + "')", conn);
            cmd.Connection = conn;
            try
            {
                
                conn.Open();
                
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                conn.Close();
                conn.Dispose();
                Response.Redirect("~/Student.aspx");
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection("Data Source=AREEN-BADRAN; Initial Catalog=DB; User Id=Test; Password=Abc123$;");
            SqlCommand cmd = new SqlCommand("select * from Student WHERE Name LIKE '%" + txtSearch.Text + "%'", conn);
            cmd.Connection = conn;
            try
            {
                conn.Open();

                gvStudents.EmptyDataText = "No Records Found";
                gvStudents.DataSource = cmd.ExecuteReader();
                gvStudents.DataBind();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                conn.Close();
                conn.Dispose();
            }

        }


        protected void gvStudents_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                int gender = Convert.ToInt16(DataBinder.Eval(e.Row.DataItem, "Gender"));
                Label lblGender = e.Row.FindControl("lblGender") as Label;
                if (gender == 1)
                {
                    lblGender.Text = "Female";
                }
                else if (gender == 2)
                {
                    lblGender.Text = "Male";
                }

                int info = Convert.ToInt16(DataBinder.Eval(e.Row.DataItem, "Info"));
                Label lblInfo = e.Row.FindControl("lblInfo") as Label;
                if (info == 1)
                {
                    lblInfo.Text = "Google";
                }
                else if (info == 2)
                {
                    lblInfo.Text = "TV";
                }
                else if (info == 3)
                {
                    lblInfo.Text = "Radio";
                }
                else if (info == 4)
                {
                    lblInfo.Text = "Social Natwork";
                }

            }
        }

        protected void gvStudents_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {

        }
    }
}