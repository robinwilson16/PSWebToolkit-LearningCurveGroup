<%@ Control Language="VB" AutoEventWireup="false" CodeFile="searchnew.ascx.vb" Inherits="webcontrols_searchnew" %>

<%@ Register Assembly="PSWebEnrolmentKit" Namespace="CompassCC.ProSolution.PSWebEnrolmentKit"
    TagPrefix="cc1" %>
<%@ Register Namespace="CustomControl"
    TagPrefix="cc2" %>

<nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb" class="mt-3 mb-3 navbar bg-body-tertiary">
    <div class="container-fluid">
        <ol class="breadcrumb">
            <li class="breadcrumb-item active" aria-current="page"><i class="fa-solid fa-house"></i> Home</li>
        </ol>
    </div>
</nav>
<div class="container">
    <div class="row">

        <div class="col-lg-5 searchpanel">

            <div class="row">
                <div class="col-md-12 bd-callout bd-callout-lcg">
                    <a href="https://www.learningcurvegroup.co.uk/" title="Go to Learning Curve Group website">
                        <img class="img-fluid mb-2" src="images/logo.png" alt="Learning Curve Group" /></a>
                    <p>
                        Welcome to Learning Curve Group
                    </p>
                </div>

                <div class="col-md-12 bd-callout bd-callout-lcg bd-callout-grey1">
                    <h3>Search Criteria</h3>

                    <asp:Label ID="AcademicYear" runat="server" />

                    <!--Use the ShowAcademicYear, ShowSite, ShowCollegeLevel and ShowModeOfAttendance properties in the searchnew.ascx.vb file to hide these extra filters-->
                    <div class="mb-3">
                        <label for="txtKeywords" class="form-label">Keywords</label>
                        <div class="input-group mb-3">
                            <span class="input-group-text" id="SearchIcon"><i class="fa-solid fa-magnifying-glass"></i></span>
                            <asp:TextBox CssClass="form-control form-control-lg" ID="txtKeywords" runat="server" aria-describedby="keywordsHelp"></asp:TextBox>
                        </div>
                        <div id="keywordsHelp" class="form-text">Enter keywords above to find the course you are interested in.</div>
                    </div>

                    <div class="mb-3" id="SearchAreaForAcademicYear" runat="server">
                        <label for="cboAcademicYear" class="form-label">Academic Year</label>
                         <asp:DropDownList CssClass="form-select" ID="cboAcademicYear" runat="server"></asp:DropDownList>
                    </div>

                    <div class="mb-3" id="SearchAreaForCollegeLevel" runat="server">
                        <label for="cboAcademicYear" class="form-label">College Level</label>
                         <asp:DropDownList CssClass="form-select" ID="cboCollegeLevel" runat="server"></asp:DropDownList>
                    </div>

                    <div class="mb-3" id="SearchAreaForSite" runat="server">
                        <label for="cboAcademicYear" class="form-label">Location</label>
                         <asp:DropDownList CssClass="form-select" ID="cboSite" runat="server"></asp:DropDownList>
                    </div>

                     <div class="mb-3" id="SearchAreaForModeOfAttendance" runat="server">
                         <label for="cboAcademicYear" class="form-label">Attendance Mode</label>
                          <asp:DropDownList CssClass="form-select" ID="cboModeOfAttendance" runat="server"></asp:DropDownList>
                     </div>

                    <div class="row">
                        <div id="SearchAreaForMarketingFields" runat="server" visible="false">

                        </div>
                        <div id="SearchAreaForPageSize" runat="server">
                            <div class="col-md-4 text-left">Results per page</div>
                            <div class="col-md-8 text-left">
                                <asp:DropDownList Style="width: 100%; margin: 2px;" CssClass="searchBox textfield form-control" ID="cboPageSize" runat="server">
                                    <asp:ListItem Value="10" Text="10"></asp:ListItem>
                                    <asp:ListItem Value="15" Text="15"></asp:ListItem>
                                    <asp:ListItem Value="20" Text="20"></asp:ListItem>
                                    <asp:ListItem Value="25" Text="25"></asp:ListItem>
                                    <asp:ListItem Value="30" Text="30"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-md-12 text-center">
                            <asp:LinkButton CssClass="btn btn-info btn-lcg" ID="btnSearch" runat="server"><i class="fa-solid fa-magnifying-glass"></i> Search</asp:LinkButton>
                            <asp:Button CssClass="btn btn-info" ID="btnShowAll" runat="server" Text="Show All" Visible="false" />
                        </div>
                    </div>


                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="alert alert-danger" />
                </div>

                <div class="col-md-12 bd-callout bd-callout-info mt-3">
                    <h5>Key</h5>
                    <div class="row">
                        <div class="col-md text-center">
                            <h3 class="text-warning"><i class="fa-solid fa-hourglass-half"></i></h3>
                            <p>
                                Coming Soon
                            </p>
                        </div>
                        <div class="col-md text-center">
                            <h3 class="text-info"><i class="fa-solid fa-circle-info"></i></h3>
                            <p>
                                Enquire Now
                            </p>
                        </div>
                        <div class="col-md text-center">
                            <h3 class="text-success"><i class="fa-solid fa-file-pen"></i></h3>
                            <p>
                                Apply Now
                            </p>
                        </div>
                        <div class="col-md text-center">
                            <h3><i class="fa-solid fa-graduation-cap"></i></h3>
                            <p>
                                Enrol Now
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-lg-7 resultspanel">
            <asp:Panel class="ScrollPanel" ID="ScrollPanel" runat="server" ClientIDMode="Static" Visible="false">
                <div runat="server" id="imgdiv">
                    <asp:ListView ID="listviewGraphic" runat="server">
                        <LayoutTemplate>
                            <ul class="MarketingFieldListView">
                                <asp:PlaceHolder ID="itemPlaceHolder" runat="server"></asp:PlaceHolder>
                            </ul>
                        </LayoutTemplate>
                        <ItemTemplate>
                            <li>
                                <div style="position: relative; display: inline-block;">
                                    <asp:Button ID="btnMarketingGraphic" runat="server" CssClass="MarketingField1Image" /><br>

                                    <asp:Label ID="lblCourseInformationType" runat="server" Width="130" CssClass="imageLabel"></asp:Label>
                                    <br>
                                </div>
                            </li>
                        </ItemTemplate>
                    </asp:ListView>
                </div>
                <asp:ListView ID="SearchGrid" runat="server" DataKeyNames="CourseInformationID"
                    SelectedIndex="0">

                    <LayoutTemplate>
                        <div style="display: table; width: 100%">
                            <div style="display: table-row">

                                <div style="display: table-cell"></div>
                                <div style="display: table-cell" class="searchgridheader">Academic Year</div>
                                <div style="display: table-cell" class="searchgridheader">Description</div>

                                <div style="display: table-cell" class="searchgridheader">Relevance</div>
                            </div>

                            <asp:PlaceHolder ID="itemPlaceHolder" runat="server"></asp:PlaceHolder>

                        </div>

                    </LayoutTemplate>
                    <ItemTemplate>
                        <div class="tblrow" style="display: table-row; height: 35px;">
                            <div style="display: table-cell">
                                <asp:HyperLink ID="ApplyOrEnrolmentBtn" runat="server" />
                            </div>
                            <div style="display: table-cell">
                                <asp:Label ID="lblAcademicYear" runat="server" CssClass="searchgridcell" Text='<%#: Eval("AcademicYearID")%>' />
                            </div>
                            <div style="display: table-cell">
                                <asp:HyperLink ID="hlnkDescription" runat="server" CssClass="searchgridcell" Text='<%#: Eval("Description")%>' NavigateUrl='<%# String.Format("~/webenrolment.aspx?page=~/webcontrols/coursedisplay.ascx&CourseInformationID={0}", Eval("CourseInformationID")) %>'></asp:HyperLink>
                            </div>
                            <div style="display: table-cell">
                                <asp:Label ID="lblScore" runat="server" CssClass="searchgridcell" />
                            </div>
                        </div>
                    </ItemTemplate>
                    <EmptyDataTemplate>
                        <p>
                            No relevant courses found, please try different search criteria.
                        </p>
                        <p>
                            HINT: Try alternative wording E.g. If &#39;Computer&#39; doesn&#39;t return results
                               try &#39;Computing&#39; or &#39;Computers&#39;.
                        </p>
                    </EmptyDataTemplate>
                </asp:ListView>
            </asp:Panel>

            <div class="searchgridfooter text-center">

                <asp:DataPager ID="dpSearchGrid" runat="server" PagedControlID="SearchGrid" PageSize="10" EnableViewState="True" ClientIDMode="Static">
                    <Fields>
                        <asp:NextPreviousPagerField FirstPageText="&lt;&lt;" ShowFirstPageButton="False" ShowNextPageButton="False" ShowPreviousPageButton="True" PreviousPageText="&lt;" />
                        <asp:NumericPagerField ButtonCount="20" />
                        <asp:NextPreviousPagerField LastPageText="&gt;&gt;" ShowLastPageButton="False" ShowNextPageButton="True" ShowPreviousPageButton="False" NextPageText="&gt;" />
                    </Fields>


                </asp:DataPager>
            </div>
        </div>

    </div>
</div>
<div class="container">
    <div class="row mt-3">
        <div class="col-md alert alert-primary hstack gap-3" role="alert">
            <div>
                <i class="fa-solid fa-circle-info"></i>
            </div>
            <div>
                <p>
                    Alternatively, if you are unsure of the exact course you would like to apply to, or would just like someone from the College to contact you with further information, 
<a class="btn btn-primary" href="webenrolment.aspx?page=~/webcontrols/checkout_generic_enquiry.ascx"><i class="fa-solid fa-comments"></i> click here</a> to send a generic enquiry.
                </p>
            </div>
        </div>
    </div>
</div>
