using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
//using Efrat.Dal.EntitiesData;
namespace FollowMe.Forms
{
    public partial class NewProcess : System.Web.UI.Page
    {

        DataTable dtReaders;
        DataTable dtColors;
        FollowMeDBEntities entity = new FollowMeDBEntities();
        static int i = 0;
        ucStation uc;
        List<ucStation> lUcStation;
        public List<ucStation> LUcStation
        {
            get
            {
                if (Session["lUcStation"] == null)
                {
                    Session["lUcStation"] = new List<ucStation>();
                }
                return (List<ucStation>)Session["lUcStation"];
            }
            set { Session["lUcStation"] = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlReaders.DataSource = entity.Station.ToList();
                ddlReaders.DataTextField = "Name";
                ddlReaders.DataValueField = "StationId";
                ddlReaders.DataBind();



                ddlColor.DataSource = entity.Colors.ToList();
                ddlColor.DataTextField = "ColorName";
                ddlColor.DataValueField = "ColorId";
                ddlColor.DataBind();
                Session["dtColors"] = entity.Colors.ToList();
            }
            else
            {
                updateView();
            }
        }

        protected void Page_PreInit(object sender, EventArgs e)
        {
            if (Session["MasterPage"] != null)
            {
                MasterPage master = Session["MasterPage"] as MasterPage;
                this.MasterPageFile = master.MasterPageFile;
            }
        }
        ucStation UcStation;
        void updateView()
        {
            List<ucStation> lEzer = new List<ucStation>();
            foreach (ucStation item in LUcStation)
            {
                UcStation = this.LoadControl("ucStation.ascx") as ucStation;
                UcStation.TypeId = item.TypeId;
                UcStation.Type = item.Type;
                UcStation.Time = item.Time;
                UcStation.Details = item.Details;
                UcStation.OnCancel += new Cancellation(UcStation_OnCancel);
                pnlStation.Controls.Add(UcStation);
                lEzer.Add(UcStation);
            }
            LUcStation = lEzer;
        }

        void UcStation_OnCancel(ucStation uc)
        {
            LUcStation.Remove(uc);
            Session["lUcStation"] = LUcStation;
            pnlStation.Controls.Remove(uc);
        }

        protected void btnChoose_Click(object sender, EventArgs e)
        {
            if (String.Compare(btnChoose.Text, "Choosed") == 0)
            {
                btnOk.Visible = true;
                ddlReaders.Enabled = false;
                btnChoose.Text = "Add station";
                uc = this.LoadControl("ucStation.ascx") as ucStation;
                uc.TypeId = Convert.ToInt32(ddlReaders.SelectedValue);
                uc.Type = ddlReaders.SelectedItem.ToString();
                uc.OnCancel += new Cancellation(UcStation_OnCancel);
                pnlStation.Controls.Add(uc);
                LUcStation.Add(uc);
            }
            else
            {
                btnOk.Visible = false;
                ddlReaders.Enabled = true;
                btnChoose.Text = "Choosed";
            }
        }

        protected void btnOk_Click(object sender, EventArgs e)
        {
            if (LUcStation == null)
            {
                ClientScript.RegisterStartupScript(GetType(), "Message", "<SCRIPT LANGUAGE='javascript'>alert(' You  must choose least one station! ')</script>");
            }
            else
            {
                bool flag = true;
                int id = 0;
                if (!entity.Colors.Any(x => x.ColorName == txtColor.Text))
                    entity.ColorsInsert(txtColor.Text);
                id = entity.Colors.Where(x => x.ColorName == txtColor.Text).First().ColorId;            
                 entity.ProcessesInsert(txtProcess.Text, id);
                foreach (ucStation item in LUcStation)
                {
                    entity.ProcessDetailsInsert(Convert.ToInt32(item.TypeId),Convert.ToInt32(item.Time),item.Details);
                }
                if (Session["edit"] != null)
                {
                    bool edit = (bool)Session["edit"];
                    if (edit)
                    {
                        if (Session["gvr"] != null)
                        {
                            GridViewRow gvr = Session["gvr"] as GridViewRow;
                            gvProcess.DeleteRow(gvr.RowIndex);
                            Session["edit"] = null;
                        }
                    }
                }
                ChangeVisible();
                Session["lUcStation"] = LUcStation;
                gvProcess.DataBind();

            }
        }


        protected void ddlColor_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtColor.Text = ddlColor.SelectedItem.Text;
        }

        protected void gvProcess_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            GridViewRow gvr = gvProcess.Rows[e.NewSelectedIndex];
            Session["gvr"] = gvr;
        }

        protected void btnNew_Click(object sender, EventArgs e)
        {
            // ClientScript.RegisterStartupScript(GetType(),  "Message", "<SCRIPT LANGUAGE='javascript'>alert(' Do you want to create a process based on existing process? ')</script>");
            //pnlEdit.Visible = ViewEdit();

            {
                pnlEdit.Visible = true;
                gvProcess.Visible = false;
                btnEdit.Enabled = false;
                btnNew.Enabled = false;
            }
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            bool succed = ViewEdit();
            Session["edit"] = succed;
            pnlEdit.Visible = succed;
        }

        protected bool ViewEdit()
        {
            if (gvProcess.SelectedIndex == -1)
            {
                ClientScript.RegisterStartupScript(GetType(),
                  "Message", "<SCRIPT LANGUAGE='javascript'>alert(' You must select editing process ')</script>");
                return false;
            }
            else
            {
                btnEdit.Enabled = false;
                btnNew.Enabled = false;
                gvProcess.Visible = false;
                if (Session["gvr"] != null)
                {
                    GridViewRow gvr = Session["gvr"] as GridViewRow;
                    txtProcess.Text = gvr.Cells[2].Text;
                    bool flag = true;
                    if (Session["dtColors"] != null)
                    {
                        dtColors = Session["dtColors"] as DataTable;
                        for (int i = 0; flag == true && i < entity.Colors.ToList().Count; i++)
                        {
                            if (((int)entity.Colors.ToList()[i].ColorId) == Convert.ToInt32((gvr.Cells[3].Text)))
                            {
                                flag = false;
                                ddlColor.SelectedIndex = i;
                            }
                        }
                    }
                    txtColor.Text = gvr.Cells[3].Text;
                    var dtProcessDetails =entity.ProcessDetailsSelect(Convert.ToInt32(gvr.Cells[1].Text)).ToList();
                    pnlStation.Controls.Clear();
                    for (int i = 0; i < dtProcessDetails.Count; i++)
                    {
                        uc = this.LoadControl("ucStation.ascx") as ucStation;
                        uc.TypeId = (int)(dtProcessDetails[i].StationId);
                        uc.Type = dtProcessDetails[i].Station.ToString();
                        uc.Time = dtProcessDetails[i].Minutes.ToString();
                        uc.Details = dtProcessDetails[i].More_details.ToString();
                        uc.OnCancel += new Cancellation(UcStation_OnCancel);
                        pnlStation.Controls.Add(uc);
                        LUcStation.Add(uc);
                    }
                    btnOk.Visible = true;
                }
            }
            return true;
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            ChangeVisible();
        }

        private void ChangeVisible()
        {
            pnlEdit.Visible = false;
            pnlStation.Controls.Clear();
            LUcStation.Clear();
            gvProcess.Visible = true;
            txtColor.Text = "";
            txtProcess.Text = "";
            ddlColor.SelectedIndex = 0;
            btnEdit.Enabled = true;
            btnNew.Enabled = true;
        }
    }
}
