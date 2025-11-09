Imports CompassCC.CCCSystem.CCCCommon
Imports CompassCC.ProSolution.PSWebEnrolmentKit
Imports System.Data
Imports PdfSharp.Pdf.Content.Objects
Imports CommandType = System.Data.CommandType
Imports System.Data.SqlClient


Partial Class UserControlMasterPage
    Inherits System.Web.UI.MasterPage
    Implements IHttpModule
    Public Overrides Sub Dispose()

    End Sub

    Public Shadows Sub Init(context As HttpApplication)
        AddHandler context.BeginRequest, New EventHandler(AddressOf context_BeginRequest)
    End Sub

    Private Sub context_BeginRequest(sender As Object, e As EventArgs)

        Dim currentContext As HttpContext = TryCast(sender, HttpApplication).Context
        If (currentContext.Request.Url.ToString().Contains("OfferingID") _
                    Or currentContext.Request.Url.ToString().Contains("Offering1ID") _
                    Or currentContext.Request.Url.ToString().Contains("Offering2ID") _
                    Or currentContext.Request.Url.ToString().Contains("Offering3ID") _
                    Or currentContext.Request.Url.ToString().Contains("Offering4ID") _
                    Or currentContext.Request.Url.ToString().Contains("Offering5ID")) Then
            currentContext.SetSessionStateBehavior(System.Web.SessionState.SessionStateBehavior.ReadOnly)
        Else
            currentContext.SetSessionStateBehavior(System.Web.SessionState.SessionStateBehavior.Default)
        End If

    End Sub

    Private Sub IHttpModule_Init(context As HttpApplication) Implements IHttpModule.Init
        Throw New NotImplementedException()
    End Sub

    Private Sub IHttpModule_Dispose() Implements IHttpModule.Dispose
        Throw New NotImplementedException()
    End Sub

    '' Load all offering ID's from URL as properties
    Public ReadOnly Property OfferingID() As Integer
        Get
            If Me.DesignMode OrElse CCCBlankLibrary.IsBlank(Me.Page.Request("OfferingID")) Then
                Return -1
            Else
                Return CInt(Me.Page.Request("OfferingID"))
            End If
        End Get
    End Property
    Public ReadOnly Property Offering1ID() As Integer
        Get
            If Me.DesignMode OrElse CCCBlankLibrary.IsBlank(Me.Page.Request("Offering1ID")) Then
                Return -1
            Else
                Return CInt(Me.Page.Request("Offering1ID"))
            End If
        End Get
    End Property
    Public ReadOnly Property Offering2ID() As Integer
        Get
            If Me.DesignMode OrElse CCCBlankLibrary.IsBlank(Me.Page.Request("Offering2ID")) Then
                Return -1
            Else
                Return CInt(Me.Page.Request("Offering2ID"))
            End If
        End Get
    End Property
    Public ReadOnly Property Offering3ID() As Integer
        Get
            If Me.DesignMode OrElse CCCBlankLibrary.IsBlank(Me.Page.Request("Offering3ID")) Then
                Return -1
            Else
                Return CInt(Me.Page.Request("Offering3ID"))
            End If
        End Get
    End Property
    Public ReadOnly Property Offering4ID() As Integer
        Get
            If Me.DesignMode OrElse CCCBlankLibrary.IsBlank(Me.Page.Request("Offering4ID")) Then
                Return -1
            Else
                Return CInt(Me.Page.Request("Offering4ID"))
            End If
        End Get
    End Property
    Public ReadOnly Property Offering5ID() As Integer
        Get
            If Me.DesignMode OrElse CCCBlankLibrary.IsBlank(Me.Page.Request("Offering5ID")) Then
                Return -1
            Else
                Return CInt(Me.Page.Request("Offering5ID"))
            End If
        End Get
    End Property

    Protected Overrides Sub OnLoad(e As EventArgs)
        MyBase.OnLoad(e)

        If Not IsPostBack Then
            PutAllOfferingsInBasket()
            PopulateOfferingFeeTable()

            Dim i As Byte = 1
            For Each c As ShoppingCartItem In WorkingData.ShoppingCart.Items
                c.ChoiceNumber = i
                i = CByte(i + 1)
            Next
        End If

        LoadLinks()

    End Sub


    'Private Sub sqlproc()


    '    ' Call the stored procedure

    '    'Private strConn As String = "Data Source=SERVER;Initial Catalog=Master;Integrated Security=True"
    '    'Private sqlCon As SqlConnection

    '    'Dim respondent_count_Command = New SqlCommand
    '    'respondent_count_Command.Connection = sqlCon
    '    'respondent_count_Command.CommandType = CommandType.StoredProcedure

    '    '' Declare output parameter
    '    'Dim param_count = New SqlParameter()
    '    'param_count.ParameterName = "@Count"
    '    'param_count.SqlDbType = SqlDbType.Int
    '    'param_count.Direction = ParameterDirection.Output
    '    'respondent_count_Command.Parameters.Add(param_count)

    '    '' Execute the procedure
    '    'respondent_count_Command.CommandText = "[server].[dbo].[sproc]"

    '    'respondent_count_Command.ExecuteNonQuery()

    '    'field = param_count.Value

    'End Sub


    'Private Sub LoadData()

    '    Dim strQuery As String
    '    Dim strConn As String = "Data Source=SERVER;Initial Catalog=Master;Integrated Security=True"
    '    Dim sqlCon As SqlConnection

    '    strQuery = "SELECT * FROM tblSPExample"

    '    sqlCon = New SqlConnection(strConn)

    '    Using (sqlCon)

    '        Dim sqlComm As SqlCommand = New SqlCommand(strQuery, sqlCon)

    '        sqlCon.Open()

    '        Dim sqlReader As SqlDataReader = sqlComm.ExecuteReader()

    '        If sqlReader.HasRows Then

    '            While (sqlReader.Read())

    '                txtName.Text = sqlReader.GetString(1)
    '                txtSurname.Text = sqlReader.GetString(2)
    '                txtAge.Text = sqlReader.GetValue(3)

    '            End While


    '        End If

    '        sqlReader.Close()

    '    End Using

    'End Sub


    'Private Sub CreateTable()

    '    Dim strConn As String = "Data Source=SERVER;Initial Catalog=Master;Integrated Security=True"
    '    '    Dim sqlCon As SqlConnection

    '    Dim strQuery As String
    '    '    Dim strConn As String = "Data Source=SERVER;Initial Catalog=Master;Integrated Security=True"
    '    '    Dim sqlCon As SqlConnection

    '    Using (sqlCon)

    '        Dim sqlComm As New SqlCommand

    '        sqlComm.Connection = sqlCon

    '        sqlComm.CommandText = "CreateTable"
    '        sqlComm.CommandType = CommandType.StoredProcedure


    '        sqlCon.Open()

    '        sqlComm.ExecuteNonQuery()

    '    End Using

    'End Sub

    'Private Sub InsertNewRecord()
    '    Dim strQuery As String
    '    '    Dim strConn As String = "Data Source=SERVER;Initial Catalog=Master;Integrated Security=True"
    '    '    Dim sqlCon As SqlConnection

    '    sqlCon = New SqlConnection(strConn)

    '    Using (sqlCon)

    '        Dim sqlComm As New SqlCommand()

    '        sqlComm.Connection = sqlCon

    '        sqlComm.CommandText = "InsertDataIntoTable"
    '        sqlComm.CommandType = CommandType.StoredProcedure

    '        sqlComm.Parameters.AddWithValue("FirstName", txtName.Text)
    '        sqlComm.Parameters.AddWithValue("Surname", txtSurname.Text)
    '        sqlComm.Parameters.AddWithValue("Age", Integer.Parse(txtAge.Text))

    '        sqlCon.Open()

    '        sqlComm.ExecuteNonQuery()

    '    End Using


    '    LoadData()

    'End Sub
    'Private Sub UpdateRecord()
    '    Dim strQuery As String
    '    '    '    Dim strConn As String = "Data Source=SERVER;Initial Catalog=Master;Integrated Security=True"
    '    '    '    Dim sqlCon As SqlConnection

    '    sqlCon = New SqlConnection(strConn)

    '    Using (sqlCon)

    '        Dim sqlComm As New SqlCommand

    '        sqlComm.Connection = sqlCon


    '        sqlComm.CommandText = "UpdateDataInsideTable"
    '        sqlComm.CommandType = CommandType.StoredProcedure

    '        sqlComm.Parameters.AddWithValue("Name", txtName.Text)
    '        sqlComm.Parameters.AddWithValue("Surname", txtSurname.Text)
    '        sqlComm.Parameters.AddWithValue("Age", Integer.Parse(txtAge.Text))

    '        sqlCon.Open()

    '        sqlComm.ExecuteNonQuery()

    '    End Using

    '    LoadData()

    'End Sub

    'Private Sub DeleteRecord()

    '    sqlCon = New SqlConnection(strConn)


    '    Using (sqlCon)

    '        Dim sqlComm As New SqlCommand

    '        sqlComm.Connection = sqlCon

    '        sqlComm.CommandText = "DeleteDataFromTable"
    '        sqlComm.CommandType = CommandType.StoredProcedure

    '        sqlComm.Parameters.AddWithValue("StudentID", Integer.Parse(txtSearch.Text))


    '        sqlCon.Open()

    '        sqlComm.ExecuteNonQuery()

    '    End Using

    '    LoadData()

    'End Sub
    Protected Sub PutAllOfferingsInBasket()


        Dim IntOffering1ID As Integer = Me.Offering1ID
        If IntOffering1ID <> -1 Then

            Dim tblOffering1 As New OfferingDataTable
            Dim v As CCCDataViewDataSet = CCCDataViewDataSet.CreateDataView(tblOffering1)
            v.Columns.AddPKColumns()
            v.Columns.EnsureColumnsAreSelected(True, False, tblOffering1.WebSiteAvailabilityIDColumn, tblOffering1.CourseInformationIDColumn, tblOffering1.TotalFeeAmountColumn, tblOffering1.OfferingTypeIDColumn)
            v.Filters.SetColumnFilter(tblOffering1.OfferingIDColumn, IntOffering1ID)
            tblOffering1.TableAdapter.Load(tblOffering1, v)

            With tblOffering1(0)

                If tblOffering1.Count > 0 AndAlso tblOffering1(0).OfferingTypeID.HasValue Then

                    Dim OfferingTypeSelect As String = .OfferingTypeID.Value.ToString

                    If OfferingTypeSelect.ToString.Length > 0 Then

                        '  WorkingData.EnrolmentRequestRow.StudentDetailUserDefined42 = OfferingTypeSelect

                        'ddlCourseType.SelectedValue = OfferingTypeSelect

                    End If

                End If
            End With

            If tblOffering1.Count > 0 AndAlso tblOffering1(0).WebSiteAvailabilityID.HasValue Then
                Dim item As New ShoppingCartItem()
                With tblOffering1(0)
                    'Dim CourseOfferingFees As New CourseOfferingFees(CType(.OfferingID, Integer))



                    If .TotalFeeAmount.HasValue Then
                        item.Cost = CDec(.TotalFeeAmount.Value.ToString())
                    End If
                    item.Description = .GetRowDescription
                    item.ItemType = "Enrolment"
                    item.OfferingID = .OfferingID.Value
                    item.CourseInfoID = .CourseInformationID.GetValueOrDefault

                End With
                With WorkingData.ShoppingCart
                    If Not .Items.Contains(item) Then
                        .Items.Add(item)

                    End If
                End With


            End If
        End If

        Dim IntOffering2ID As Integer = Me.Offering2ID

        If IntOffering2ID <> -1 Then

            Dim tblOffering2 As New OfferingDataTable
            Dim v As CCCDataViewDataSet = CCCDataViewDataSet.CreateDataView(tblOffering2)
            v.Columns.AddPKColumns()
            v.Columns.EnsureColumnsAreSelected(True, False, tblOffering2.WebSiteAvailabilityIDColumn, tblOffering2.CourseInformationIDColumn, tblOffering2.TotalFeeAmountColumn, tblOffering2.OfferingTypeIDColumn)
            v.Filters.SetColumnFilter(tblOffering2.OfferingIDColumn, IntOffering2ID)
            tblOffering2.TableAdapter.Load(tblOffering2, v)
            With tblOffering2(0)

                If tblOffering2.Count > 0 AndAlso tblOffering2(0).OfferingTypeID.HasValue Then

                    Dim OfferingTypeSelect As String = .OfferingTypeID.Value.ToString

                    If OfferingTypeSelect.ToString.Length > 0 Then

                        ' WorkingData.EnrolmentRequestRow.StudentDetailUserDefined42 = OfferingTypeSelect
                        ' ddlCourseType.SelectedValue = OfferingTypeSelect

                    End If

                End If
            End With

            If tblOffering2.Count > 0 AndAlso tblOffering2(0).WebSiteAvailabilityID.HasValue Then
                Dim item As New ShoppingCartItem()
                With tblOffering2(0)

                    'Dim CourseOfferingFees As New CourseOfferingFees(CType(.OfferingID, Integer))

                    If .TotalFeeAmount.HasValue Then
                        item.Cost = CDec(.TotalFeeAmount.Value.ToString())
                    End If
                    item.Description = .GetRowDescription
                    item.ItemType = "Enrolment"
                    item.OfferingID = .OfferingID.Value
                    item.CourseInfoID = .CourseInformationID.GetValueOrDefault

                End With
                With WorkingData.ShoppingCart
                    If Not .Items.Contains(item) Then
                        .Items.Add(item)
                    End If
                End With

            End If
        End If
        Dim IntOffering3ID As Integer = Me.Offering3ID

        If IntOffering3ID <> -1 Then

            Dim tblOffering3 As New OfferingDataTable
            Dim v As CCCDataViewDataSet = CCCDataViewDataSet.CreateDataView(tblOffering3)
            v.Columns.AddPKColumns()
            v.Columns.EnsureColumnsAreSelected(True, False, tblOffering3.WebSiteAvailabilityIDColumn, tblOffering3.CourseInformationIDColumn, tblOffering3.TotalFeeAmountColumn, tblOffering3.OfferingTypeIDColumn)
            v.Filters.SetColumnFilter(tblOffering3.OfferingIDColumn, IntOffering3ID)
            tblOffering3.TableAdapter.Load(tblOffering3, v)
            With tblOffering3(0)

                If tblOffering3.Count > 0 AndAlso tblOffering3(0).OfferingTypeID.HasValue Then

                    Dim OfferingTypeSelect As String = .OfferingTypeID.Value.ToString

                    If OfferingTypeSelect.ToString.Length > 0 Then

                        '  WorkingData.EnrolmentRequestRow.StudentDetailUserDefined42 = OfferingTypeSelect
                        ' ddlCourseType.SelectedValue = OfferingTypeSelect

                    End If

                End If
            End With

            If tblOffering3.Count > 0 AndAlso tblOffering3(0).WebSiteAvailabilityID.HasValue Then
                Dim item As New ShoppingCartItem()
                With tblOffering3(0)

                    '   Dim CourseOfferingFees As New CourseOfferingFees(CType(.OfferingID, Integer))

                    If .TotalFeeAmount.HasValue Then
                        item.Cost = CDec(.TotalFeeAmount.Value.ToString())
                    End If

                    item.Description = .GetRowDescription
                    item.ItemType = "Enrolment"
                    item.OfferingID = .OfferingID.Value
                    item.CourseInfoID = .CourseInformationID.GetValueOrDefault

                End With
                With WorkingData.ShoppingCart
                    If Not .Items.Contains(item) Then
                        .Items.Add(item)
                    End If
                End With

            End If
        End If

        Dim IntOffering4ID As Integer = Me.Offering4ID

        If IntOffering4ID <> -1 Then

            Dim tblOffering4 As New OfferingDataTable
            Dim v As CCCDataViewDataSet = CCCDataViewDataSet.CreateDataView(tblOffering4)
            v.Columns.AddPKColumns()
            v.Columns.EnsureColumnsAreSelected(True, False, tblOffering4.WebSiteAvailabilityIDColumn, tblOffering4.CourseInformationIDColumn, tblOffering4.TotalFeeAmountColumn, tblOffering4.OfferingTypeIDColumn)
            v.Filters.SetColumnFilter(tblOffering4.OfferingIDColumn, IntOffering4ID)
            tblOffering4.TableAdapter.Load(tblOffering4, v)
            With tblOffering4(0)

                If tblOffering4.Count > 0 AndAlso tblOffering4(0).OfferingTypeID.HasValue Then

                    Dim OfferingTypeSelect As String = .OfferingTypeID.Value.ToString

                    If OfferingTypeSelect.ToString.Length > 0 Then

                        '   WorkingData.EnrolmentRequestRow.StudentDetailUserDefined42 = OfferingTypeSelect
                        '  ddlCourseType.SelectedValue = OfferingTypeSelect

                    End If

                End If
            End With

            If tblOffering4.Count > 0 AndAlso tblOffering4(0).WebSiteAvailabilityID.HasValue Then
                Dim item As New ShoppingCartItem()
                With tblOffering4(0)

                    '  Dim CourseOfferingFees As New CourseOfferingFees(CType(.OfferingID, Integer))

                    If .TotalFeeAmount.HasValue Then
                        item.Cost = CDec(.TotalFeeAmount.Value.ToString())
                    End If
                    item.Description = .GetRowDescription
                    item.ItemType = "Enrolment"
                    item.OfferingID = .OfferingID.Value
                    item.CourseInfoID = .CourseInformationID.GetValueOrDefault

                End With
                With WorkingData.ShoppingCart
                    If Not .Items.Contains(item) Then
                        .Items.Add(item)
                    End If
                End With

            End If
        End If
        Dim IntOffering5ID As Integer = Me.Offering5ID

        If IntOffering5ID <> -1 Then

            Dim tblOffering5 As New OfferingDataTable
            Dim v As CCCDataViewDataSet = CCCDataViewDataSet.CreateDataView(tblOffering5)
            v.Columns.AddPKColumns()
            v.Columns.EnsureColumnsAreSelected(True, False, tblOffering5.WebSiteAvailabilityIDColumn, tblOffering5.CourseInformationIDColumn, tblOffering5.TotalFeeAmountColumn, tblOffering5.OfferingTypeIDColumn)
            v.Filters.SetColumnFilter(tblOffering5.OfferingIDColumn, IntOffering5ID)
            tblOffering5.TableAdapter.Load(tblOffering5, v)
            With tblOffering5(0)

                If tblOffering5.Count > 0 AndAlso tblOffering5(0).OfferingTypeID.HasValue Then

                    Dim OfferingTypeSelect As String = .OfferingTypeID.Value.ToString

                    If OfferingTypeSelect.ToString.Length > 0 Then

                        '  WorkingData.EnrolmentRequestRow.StudentDetailUserDefined42 = OfferingTypeSelect
                        '  ddlCourseType.SelectedValue = OfferingTypeSelect

                    End If

                End If
            End With

            If tblOffering5.Count > 0 AndAlso tblOffering5(0).WebSiteAvailabilityID.HasValue Then
                Dim item As New ShoppingCartItem()
                With tblOffering5(0)

                    '  Dim CourseOfferingFees As New CourseOfferingFees(CType(.OfferingID, Integer))

                    If .TotalFeeAmount.HasValue Then
                        item.Cost = CDec(.TotalFeeAmount.Value.ToString())
                    End If
                    item.Description = .GetRowDescription
                    item.ItemType = "Enrolment"
                    item.OfferingID = .OfferingID.Value
                    item.CourseInfoID = .CourseInformationID.GetValueOrDefault

                End With
                With WorkingData.ShoppingCart
                    If Not .Items.Contains(item) Then
                        .Items.Add(item)
                    End If
                End With

            End If
        End If




        Dim intOfferingID As Integer = Me.OfferingID
        If intOfferingID <> -1 Then

            Dim tblOffering As New OfferingDataTable
            Dim v As CCCDataViewDataSet = CCCDataViewDataSet.CreateDataView(tblOffering)
            v.Columns.AddPKColumns()
            v.Columns.EnsureColumnsAreSelected(True, False, tblOffering.WebSiteAvailabilityIDColumn, tblOffering.CourseInformationIDColumn, tblOffering.TotalFeeAmountColumn, tblOffering.OfferingTypeIDColumn)
            v.Filters.SetColumnFilter(tblOffering.OfferingIDColumn, intOfferingID)
            tblOffering.TableAdapter.Load(tblOffering, v)

            With tblOffering(0)

                If tblOffering.Count > 0 AndAlso tblOffering(0).OfferingTypeID.HasValue Then

                    Dim OfferingTypeSelect As String = .OfferingTypeID.Value.ToString

                    If OfferingTypeSelect.ToString.Length > 0 Then

                        '  WorkingData.EnrolmentRequestRow.StudentDetailUserDefined42 = OfferingTypeSelect
                        '   ddlCourseType.SelectedValue = OfferingTypeSelect

                    End If

                End If
            End With

            If tblOffering.Count > 0 AndAlso tblOffering(0).WebSiteAvailabilityID.HasValue Then
                Dim item As New ShoppingCartItem()
                With tblOffering(0)

                    '   Dim CourseOfferingFees As New CourseOfferingFees(CType(.OfferingID, Integer))
                    If .TotalFeeAmount.HasValue Then
                        item.Cost = CDec(.TotalFeeAmount.Value.ToString())
                    End If
                    item.Description = .GetRowDescription
                    item.ItemType = "Enrolment"
                    item.OfferingID = .OfferingID.Value
                    item.CourseInfoID = .CourseInformationID.GetValueOrDefault

                End With
                With WorkingData.ShoppingCart
                    If Not .Items.Contains(item) Then
                        .Items.Add(item)
                    End If
                End With
            End If
        End If



    End Sub

    ''Bring in the Fees
    Protected Sub PopulateOfferingFeeTable()
        'Load all offerings in the shopping basket
        Dim stb As New Text.StringBuilder
        For Each item As ShoppingCartItem In WorkingData.ShoppingCart.Items
            If stb.Length > 0 Then stb.Append(",")
            stb.Append(item.OfferingID)

        Next
        If stb.Length > 0 Then
            'Load offerings
            Dim tblOffering As New OfferingDataTable
            Dim vOffering As CCCDataViewDataSet = CCCDataViewDataSet.CreateDataViewDefault(tblOffering)
            vOffering.Columns.AddPKColumns()
            vOffering.Columns.EnsureColumnsAreSelected(True, False, tblOffering.CodeColumn, tblOffering.StartTimeColumn, tblOffering.DayOfWeekColumn, tblOffering.StartDateColumn, tblOffering.EndDateColumn, tblOffering.SiteDescriptionColumn, tblOffering.EndTimeColumn, tblOffering.TotalFeeAmountColumn)
            vOffering.Columns.EnsureColumnIsSelected(False, False, tblOffering.KISCourseCodeColumn)

            vOffering.Filters.SetColumnFilter(tblOffering.OfferingIDColumn, stb.ToString, FilterOperator.OperatorInList)

            tblOffering.TableAdapter.Load(tblOffering, vOffering)


        End If
    End Sub


    Protected Overrides Sub OnPreRender(e As EventArgs)
        MyBase.OnPreRender(e)



    End Sub


    Private Sub LoadLinks()

   Dim htmlHeader As HtmlHead = CType(Page.Master.FindControl("header"), HtmlHead)

        Dim css6 As New HtmlGenericSelfClosing()
        css6.TagName = "link"
        css6.Attributes.Add("rel", "stylesheet")
        css6.Attributes.Add("type", "text/css")
        css6.Attributes("href") = ResolveUrl("~/content/toastr.min.css")
        htmlHeader.Controls.Add(css6)

        Dim css2 As New HtmlGenericSelfClosing()
        css2.TagName = "link"
        css2.Attributes.Add("rel", "stylesheet")
        css2.Attributes.Add("type", "text/css")
        'css2.Attributes("href") = ResolveUrl("~/content/bootstrap.min.css")
        css2.Attributes("href") = ResolveUrl("~/Scripts/bootstrap/css/bootstrap.min.css")
        htmlHeader.Controls.Add(css2)

        Dim cssFA As New HtmlGenericSelfClosing()
        cssFA.TagName = "link"
        cssFA.Attributes.Add("rel", "stylesheet")
        cssFA.Attributes.Add("type", "text/css")
        cssFA.Attributes("href") = ResolveUrl("~/Scripts/font-awesome/css/all.min.css")
        htmlHeader.Controls.Add(cssFA)

        Dim cssCO As New HtmlGenericSelfClosing()
        cssCO.TagName = "link"
        cssCO.Attributes.Add("rel", "stylesheet")
        cssCO.Attributes.Add("type", "text/css")
        cssCO.Attributes("href") = ResolveUrl("~/content/callout.css")
        htmlHeader.Controls.Add(cssCO)

        Dim cssCollege As New HtmlGenericSelfClosing()
        cssCollege.TagName = "link"
        cssCollege.Attributes.Add("rel", "stylesheet")
        cssCollege.Attributes.Add("type", "text/css")
        cssCollege.Attributes("href") = ResolveUrl("~/content/lcg.css")
        htmlHeader.Controls.Add(cssCollege)

        Dim css4 As New HtmlGenericSelfClosing()
        css4.TagName = "link"
        css4.Attributes.Add("rel", "stylesheet")
        css4.Attributes.Add("type", "text/css")
        'css4.Attributes("href") = ResolveUrl("~/content/themes/base/jquery-ui.min.css")
        css4.Attributes("href") = ResolveUrl("~/Scripts/jquery-ui/themes/base/jquery-ui.min.css")
        htmlHeader.Controls.Add(css4)

        Dim cssp As New HtmlGenericSelfClosing()
        cssp.TagName = "link"
        cssp.Attributes.Add("rel", "stylesheet")
        cssp.Attributes.Add("type", "text/css")
        cssp.Attributes.Add("media", "print")
        cssp.Attributes("href") = ResolveUrl("~/content/ProSolutionPrint.css")
        htmlHeader.Controls.Add(cssp)

        Dim css3 As New HtmlGenericSelfClosing()
        css3.TagName = "link"
        css3.Attributes.Add("rel", "stylesheet")
        css3.Attributes.Add("type", "text/css")
        css3.Attributes("href") = ResolveUrl("~/content/custom.css")
        htmlHeader.Controls.Add(css3)



        Dim css5 As New HtmlGenericSelfClosing()
        css5.TagName = "link"
        css5.Attributes.Add("rel", "stylesheet")
        css5.Attributes.Add("type", "text/css")


        If WorkingData.ShoppingCart.ContainsItemsOfType("Enrolment") Then
            css5.Attributes("href") = GetResourceValue("EnrolmentCalendarCSS")
        ElseIf WorkingData.ShoppingCart.ContainsItemsOfType("Application") Then
            css5.Attributes("href") = GetResourceValue("ApplicationCalendarCSS")
        ElseIf WorkingData.ShoppingCart.ContainsItemsOfType("Enquiry") Then
            css5.Attributes("href") = GetResourceValue("EnquiryCalendarCSS")
        Else
            css5.Attributes("href") = GetResourceValue("EnrolmentCalendarCSS")
        End If

        htmlHeader.Controls.Add(css5)


        Dim js1 As New HtmlGenericControl("script")
        js1.Attributes("type") = "text/javascript"
        ''CCCPS-77643: Upgraded JQuery with latest version.
        'js1.Attributes("src") = ResolveUrl("~/Scripts/jquery-3.6.0.min.js")
        js1.Attributes("src") = ResolveUrl("~/Scripts/jquery/jquery.min.js")
        htmlHeader.Controls.Add(js1)

        Dim js2 As New HtmlGenericControl("script")
        js2.Attributes("type") = "text/javascript"
        js2.Attributes("src") = ResolveUrl("~/Scripts/respond.min.js")
        htmlHeader.Controls.Add(js2)

        Dim js3 As New HtmlGenericControl("script")
        js3.Attributes("type") = "text/javascript"
        js3.Attributes("src") = ResolveUrl("~/Scripts/html5shiv.js")
        htmlHeader.Controls.Add(js3)



        If Toastr.UseToastr Then
            Dim js7 As New HtmlGenericControl("script")
            js7.Attributes("type") = "text/javascript"
            js7.Attributes("src") = ResolveUrl("~/Scripts/toastr.min.js")
            htmlHeader.Controls.Add(js7)
        End If

        Dim js6 As New HtmlGenericControl("script")
        js6.Attributes("type") = "text/javascript"
        'js6.Attributes("src") = ResolveUrl("~/Scripts/jquery-ui-1.12.1.min.js")
        js6.Attributes("src") = ResolveUrl("~/Scripts/jquery-ui/jquery-ui.min.js")
        htmlHeader.Controls.Add(js6)

        Dim js5 As New HtmlGenericControl("script")
        js5.Attributes("type") = "text/javascript"
        'js5.Attributes("src") = ResolveUrl("~/Scripts/bootstrap.min.js")
        js5.Attributes("src") = ResolveUrl("~/Scripts/bootstrap/js/bootstrap.bundle.min.js")
        htmlHeader.Controls.Add(js5)

        Dim js4 As New HtmlGenericControl("script")
        js4.Attributes("type") = "text/javascript"
        js4.Attributes("src") = ResolveUrl("~/Scripts/custom.js")
        htmlHeader.Controls.Add(js4)

        'Dim js0 As New HtmlGenericControl("script")
        'js0.Attributes("type") = "text/javascript"
        'js0.Attributes("src") = ResolveUrl("https://unpkg.com/@popperjs/core@2.4.4/dist/umd/popper.min.js")
        'htmlHeader.Controls.Add(js0)

        'Dim js00 As New HtmlGenericControl("script")
        'js00.Attributes("type") = "text/javascript"
        'js00.Attributes("src") = ResolveUrl("https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js")
        'htmlHeader.Controls.Add(js00)

        Dim jsGetAddress As New HtmlGenericControl("script")
        jsGetAddress.Attributes("type") = "text/javascript"
        jsGetAddress.Attributes("src") = ResolveUrl("https://cdn.getaddress.io/scripts/getaddress-autocomplete-native-1.0.2.min.js")
        htmlHeader.Controls.Add(jsGetAddress)

        Dim jsCustomFunctions As New HtmlGenericControl("script")
        jsCustomFunctions.Attributes("type") = "text/javascript"
        jsCustomFunctions.Attributes("src") = ResolveUrl("~/Scripts/customFunctions.js")
        htmlHeader.Controls.Add(jsCustomFunctions)

        Dim jsCollege As New HtmlGenericControl("script")
        jsCollege.Attributes("type") = "text/javascript"
        jsCollege.Attributes("src") = ResolveUrl("~/Scripts/lcg.js")
        htmlHeader.Controls.Add(jsCollege)

    End Sub
End Class

