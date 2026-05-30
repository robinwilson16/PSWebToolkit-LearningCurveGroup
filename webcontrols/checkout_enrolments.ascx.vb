
Imports System.Data
Imports System.Data.SqlClient
Imports System.IO.Ports
Imports System.Web.UI.HtmlControls
Imports CompassCC.CCCSystem.CCCCommon
Imports CompassCC.ProSolution.PSWebEnrolmentKit
Imports Microsoft.VisualBasic.ApplicationServices
Imports PdfSharp.Pdf.Content.Objects
Imports CommandType = System.Data.CommandType

Partial Class webcontrols_checkout_enrolments
    Inherits CheckoutBaseControl

    Public CourseInformationID As Integer
    Public Is16To18 As Boolean = False
    Public Is16To25 As Boolean = False
    Private UDF53CurrentValue = Nothing
    Private UDF54CurrentValue = Nothing

    Public tblOffering As New OfferingDataTable

    Public ReadOnly Property OfferingID() As Integer
        Get
            Return WorkingData.ShoppingCart.Items(0).OfferingID
        End Get
    End Property

    Protected Overrides Sub OnLoad(e As EventArgs)

        CourseInformationID = CourseInformationHelper.GetCourseInformationID(Me.Session)

        Dim offeringRow As OfferingRow = CourseHelper.GetCourse(OfferingID)
        WorkingData.EnrolmentRequestRow.AcademicYearID = offeringRow.AcademicYearID
        CheckAge()

        SwitchFieldsBackOnLoad()

        If Not IsPostBack Then
            SetReceivedFreeSchoolMealsControl()
            SetYoungCarerControl()
            SetYoungParentControl()
        End If

        'WorkingData.EnrolmentRequestRow.FirstForename = "Test"
        'WorkingData.EnrolmentRequestRow.Surname = "Tester"
        'WorkingData.EnrolmentRequestRow.DateOfBirth = "03-sep-1996"
        ' WorkingData.EnrolmentRequestRow.Sex = "F"
        'WorkingData.EnrolmentRequestRow.EthnicGroupID = "98"
        ' WorkingData.EnrolmentRequestRow.Address1 = "317 test street"
        ' WorkingData.EnrolmentRequestRow.PostcodeOut = "B66"
        ' WorkingData.EnrolmentRequestRow.PostcodeIn = "6BZ"
        ' WorkingData.EnrolmentRequestRow.CriminalConvictionID = "2"
        ' WorkingData.EnrolmentRequestRow.Email = "b@b.com"
        ' WorkingData.EnrolmentRequestRow.MobileTel = "0766666893"

        If IsPostBack Then
            UpdateAddress()
        Else
            postcode.Value = WorkingData.EnrolmentRequestRow.PostcodeOut + WorkingData.EnrolmentRequestRow.PostcodeIn
        End If

        If Not WorkingData.CurrentLoggedOnUserRow Is Nothing Then

            If Not WorkingData.CurrentLoggedOnUserRow.Email Is Nothing Then
                'Dim SQLDBDataReader As SqlClient.SqlDataReader
                'Dim SQLDataTable As New DataTable
                'Dim cmd As New SqlCommand
                'Dim SQLCmd As New SqlClient.SqlConnection
                'SQLCmd.ConnectionString = GetConn()
                'SQLCmd.Open()
                'cmd.CommandText = "PSWebenrolmentReports.dbo.spGetStudentDetailsByEmail"
                'cmd.CommandType = CommandType.StoredProcedure
                'cmd.Connection = SQLCmd
                'cmd.Parameters.AddWithValue("email", WorkingData.CurrentLoggedOnUserRow.Email)
                'SQLDBDataReader = cmd.ExecuteReader()

                'If SQLDBDataReader.HasRows Then
                '    While (SQLDBDataReader.Read)
                '        Session("refno") = CStr(SQLDBDataReader("refno"))
                '        If Not IsDBNull(SQLDBDataReader("refno")) Then WorkingData.EnrolmentRequestRow.RefNo = CStr(SQLDBDataReader("refno"))
                '        If Not IsDBNull(SQLDBDataReader("surname")) Then
                '            WorkingData.EnrolmentRequestRow.Surname = CStr(SQLDBDataReader("surname"))
                '            Session("snamereadonly") = "Y"
                '        End If
                '        If Not IsDBNull(SQLDBDataReader("firstforename")) Then
                '            WorkingData.EnrolmentRequestRow.FirstForename = CStr(SQLDBDataReader("firstforename"))
                '            Session("fnamereadonly") = "Y"
                '        End If
                '        If Not IsDBNull(SQLDBDataReader("dateofbirth")) Then
                '            If IsDate(SQLDBDataReader("dateofbirth")) Then
                '                WorkingData.EnrolmentRequestRow.DateOfBirth = CDate(SQLDBDataReader("dateofbirth"))
                '                Session("dobreadonly") = "Y"
                '            End If
                '        End If

                '        If Not IsDBNull(SQLDBDataReader("sex")) Then WorkingData.EnrolmentRequestRow.Sex = CStr(SQLDBDataReader("sex"))
                '        If Not IsDBNull(SQLDBDataReader("schoolid")) Then WorkingData.EnrolmentRequestRow.SchoolID = CInt(SQLDBDataReader("schoolid"))
                '        If Not IsDBNull(SQLDBDataReader("address1")) Then
                '            WorkingData.EnrolmentRequestRow.Address1 = CStr(SQLDBDataReader("address1"))
                '            divAddresslines.Visible = True
                '        End If
                '        If Not IsDBNull(SQLDBDataReader("address2")) Then WorkingData.EnrolmentRequestRow.Address2 = CStr(SQLDBDataReader("address2"))
                '        If Not IsDBNull(SQLDBDataReader("address3")) Then WorkingData.EnrolmentRequestRow.Address3 = CStr(SQLDBDataReader("address3"))
                '        If Not IsDBNull(SQLDBDataReader("address4")) Then WorkingData.EnrolmentRequestRow.Address4 = CStr(SQLDBDataReader("address4"))
                '        If Not IsDBNull(SQLDBDataReader("postcodeout")) Then WorkingData.EnrolmentRequestRow.PostcodeOut = CStr(SQLDBDataReader("postcodeout"))
                '        If Not IsDBNull(SQLDBDataReader("postcodein")) Then WorkingData.EnrolmentRequestRow.PostcodeIn = CStr(SQLDBDataReader("postcodein"))
                '        If Not IsDBNull(SQLDBDataReader("postcodeout")) And Not IsDBNull(SQLDBDataReader("postcodein")) Then postcode.Value = WorkingData.EnrolmentRequestRow.PostcodeOut + " " + WorkingData.EnrolmentRequestRow.PostcodeIn
                '        If Not IsDBNull(SQLDBDataReader("email")) Then WorkingData.EnrolmentRequestRow.Email = CStr(SQLDBDataReader("email"))
                '        If Not IsDBNull(SQLDBDataReader("mobiletel")) Then WorkingData.EnrolmentRequestRow.MobileTel = CStr(SQLDBDataReader("mobiletel"))
                '        'Response.Write(SQLDBDataReader.GetString(7))
                '        'Response.Write(SQLDBDataReader.GetString(5))
                '    End While
                'End If
            End If
            If Request("pop") = "Y" Then

                WorkingData.EnrolmentRequestRow.FirstForename = "Test"
                WorkingData.EnrolmentRequestRow.Surname = "Tester"
                WorkingData.EnrolmentRequestRow.DateOfBirth = "03-sep-1996"
                WorkingData.EnrolmentRequestRow.Sex = "F"
                WorkingData.EnrolmentRequestRow.EthnicGroupID = "98"
                WorkingData.EnrolmentRequestRow.Address1 = "317 test street"
                WorkingData.EnrolmentRequestRow.PostcodeOut = "6BZ"
                WorkingData.EnrolmentRequestRow.PostcodeIn = "B66"
                WorkingData.EnrolmentRequestRow.CriminalConvictionID = "2"
                WorkingData.EnrolmentRequestRow.Email = "b@b.com"
                WorkingData.EnrolmentRequestRow.MobileTel = "0766666893"
            End If
        End If


        If Not WorkingData.EnrolmentRequestRow.OfferingID Is Nothing Then
            ' intOfferingID = CInt(Me.Page.Request("OfferingID"))
            If WorkingData.EnrolmentRequestRow.Parent2FirstName Is Nothing And 1 = 2 Then

                'linkQuals.Visible = False
                'linkParent.Visible = False
                'linkFurther.Visible = False
                'linkDeclare.Visible = False
                'linkAttach.Visible = False
                '   aQuals.Disabled = True

            End If
        End If

        If Not Session("refno") Is Nothing Then
            lblRefno.Text = CType(Session("refno"), String)
            divRefno.Visible = True
        End If

        If Session("snamereadonly") = "Y" Then fldSurname.IsReadOnly = True
        If Session("fnamereadonly") = "Y" Then fldFirstName.IsReadOnly = True
        'If Session("dobreadonly") = "Y" Then datepicker.IsReadOnly = True

        If Not Session("offeringtype") Is Nothing Then
            '    lblOfferingType.Text = CType("offeringType - " & Session("offeringtype"), String)
            If Session("offeringtype") <> "HE HEFCE Funded" Then
                '  fldUCASApplicationCode.Visible = False
                ' fldUCASPersonalID.Visible = False
                '     fldAccommodationTypeID.Visible = False
            Else

                'fldUCASPersonalID.IsRequired = True
                'fldUCASApplicationCode.IsRequired = True
                ' fldAccommodationTypeID.IsRequired = True
            End If
        End If


        MyBase.OnLoad(e)
    End Sub

    Private Sub CheckAge()
        Dim academicYear = WorkingData.EnrolmentRequestRow.AcademicYearID
        Dim dobReferenceDate As Date = CDate("20" & academicYear.Substring(0, 2) & "-08-31")
        Dim dateAt18 As Date = dobReferenceDate.AddYears(-18)
        Dim dateAt25 As Date = dobReferenceDate.AddYears(-25)

        If WorkingData.EnrolmentRequestRow.DateOfBirth > dateAt18 Then
            Is16To18 = True
        Else
            Is16To18 = False
        End If

        If WorkingData.EnrolmentRequestRow.DateOfBirth > dateAt25 Then
            Is16To25 = True
        Else
            Is16To25 = False
        End If
    End Sub

    Protected Sub ReceivedFreeSchoolMeals_Changed(sender As Object, e As EventArgs)
        Dim radioButton = TryCast(sender, RadioButton)

        If radioButton IsNot Nothing Then
            If radioButton.ID = "ReceivedFreeSchoolMealsY" Then
                SetReceivedFreeSchoolMealsValue("Y")
            ElseIf radioButton.ID = "ReceivedFreeSchoolMealsN" Then
                SetReceivedFreeSchoolMealsValue("N")
            Else
                SetReceivedFreeSchoolMealsValue("")
            End If
        End If
    End Sub

    Public Sub SetReceivedFreeSchoolMealsValue()
        If ReceivedFreeSchoolMealsY.Checked = True Then
            WorkingData.EnrolmentRequestRow.ReceivedFreeSchoolMeals = True
        ElseIf ReceivedFreeSchoolMealsN.Checked = True Then
            WorkingData.EnrolmentRequestRow.ReceivedFreeSchoolMeals = False
        Else
            WorkingData.EnrolmentRequestRow.ReceivedFreeSchoolMeals = Nothing
        End If
    End Sub

    Public Sub SetReceivedFreeSchoolMealsValue(value As String)
        If value = "Y" Then
            WorkingData.EnrolmentRequestRow.ReceivedFreeSchoolMeals = True
        ElseIf value = "N" Then
            WorkingData.EnrolmentRequestRow.ReceivedFreeSchoolMeals = False
        Else
            WorkingData.EnrolmentRequestRow.ReceivedFreeSchoolMeals = Nothing
        End If
    End Sub

    Public Sub SetReceivedFreeSchoolMealsControl()
        If WorkingData.EnrolmentRequestRow.ReceivedFreeSchoolMeals = True Then
            If ReceivedFreeSchoolMealsY IsNot Nothing And ReceivedFreeSchoolMealsN IsNot Nothing Then
                ReceivedFreeSchoolMealsY.Checked = True
            End If
        ElseIf WorkingData.EnrolmentRequestRow.ReceivedFreeSchoolMeals = False Then
            If ReceivedFreeSchoolMealsY IsNot Nothing Then
                ReceivedFreeSchoolMealsN.Checked = True
            End If
        Else
            ReceivedFreeSchoolMealsY.Checked = False
            ReceivedFreeSchoolMealsN.Checked = False
        End If
    End Sub

    Protected Sub YoungCarer_Changed(sender As Object, e As EventArgs)
        Dim radioButton = TryCast(sender, RadioButton)

        If radioButton IsNot Nothing Then
            If radioButton.ID = "YoungCarerY" Then
                SetYoungCarerValue("Y")
            ElseIf radioButton.ID = "YoungCarerN" Then
                SetYoungCarerValue("N")
            Else
                SetYoungCarerValue("")
            End If
        End If
    End Sub

    Public Sub SetYoungCarerValue()
        If YoungCarerY.Checked = True Then
            WorkingData.EnrolmentRequestRow.YoungCarer = True
        ElseIf YoungCarerN.Checked = True Then
            WorkingData.EnrolmentRequestRow.YoungCarer = False
        Else
            WorkingData.EnrolmentRequestRow.YoungCarer = Nothing
        End If
    End Sub

    Public Sub SetYoungCarerValue(value As String)
        If value = "Y" Then
            WorkingData.EnrolmentRequestRow.YoungCarer = True
        ElseIf value = "N" Then
            WorkingData.EnrolmentRequestRow.YoungCarer = False
        Else
            WorkingData.EnrolmentRequestRow.YoungCarer = Nothing
        End If
    End Sub

    Public Sub SetYoungCarerControl()
        If WorkingData.EnrolmentRequestRow.YoungCarer = True Then
            If YoungCarerY IsNot Nothing And YoungCarerN IsNot Nothing Then
                YoungCarerY.Checked = True
            End If
        ElseIf WorkingData.EnrolmentRequestRow.YoungCarer = False Then
            If YoungCarerY IsNot Nothing Then
                YoungCarerN.Checked = True
            End If
        Else
            YoungCarerY.Checked = False
            YoungCarerN.Checked = False
        End If
    End Sub

    Protected Sub YoungParent_Changed(sender As Object, e As EventArgs)
        Dim radioButton = TryCast(sender, RadioButton)

        If radioButton IsNot Nothing Then
            If radioButton.ID = "YoungParentY" Then
                SetYoungParentValue("Y")
            ElseIf radioButton.ID = "YoungParentN" Then
                SetYoungParentValue("N")
            Else
                SetYoungParentValue("")
            End If
        End If
    End Sub

    Public Sub SetYoungParentValue()
        If YoungParentY.Checked = True Then
            WorkingData.EnrolmentRequestRow.YoungParent = True
        ElseIf YoungParentN.Checked = True Then
            WorkingData.EnrolmentRequestRow.YoungParent = False
        Else
            WorkingData.EnrolmentRequestRow.YoungParent = Nothing
        End If
    End Sub

    Public Sub SetYoungParentValue(value As String)
        If value = "Y" Then
            WorkingData.EnrolmentRequestRow.YoungParent = True
        ElseIf value = "N" Then
            WorkingData.EnrolmentRequestRow.YoungParent = False
        Else
            WorkingData.EnrolmentRequestRow.YoungParent = Nothing
        End If
    End Sub

    Public Sub SetYoungParentControl()
        If WorkingData.EnrolmentRequestRow.YoungParent = True Then
            If YoungParentY IsNot Nothing And YoungParentN IsNot Nothing Then
                YoungParentY.Checked = True
            End If
        ElseIf WorkingData.EnrolmentRequestRow.YoungParent = False Then
            If YoungParentY IsNot Nothing Then
                YoungParentN.Checked = True
            End If
        Else
            YoungParentY.Checked = False
            YoungParentN.Checked = False
        End If
    End Sub

    Public Overrides Sub ValidateControl()

        CheckAge()

        If Len(txtAddress1.Value) = 0 Then
            Dim v As New CustomValidator
            v.ErrorMessage = "You must enter the 1St line Of the address"
            v.IsValid = False
            Me.Page.Validators.Add(v)
        End If

        'If Len(txtAddress3.Value) = 0 Then
        '    Dim v As New CustomValidator
        '    v.ErrorMessage = "You must enter the town"
        '    v.IsValid = False
        '    Me.Page.Validators.Add(v)
        'End If

        If Len(postcode.Value) = 0 Then
            Dim v As New CustomValidator
            v.ErrorMessage = "You must enter the postcode"
            v.IsValid = False
            Me.Page.Validators.Add(v)
        End If

        Dim regexPostCode As New Regex("^([Gg][Ii][Rr] 0[Aa]{2})|((([A-Za-z][0-9]{1,2})|(([A-Za-z][A-Ha-hJ-Yj-y][0-9]{1,2})|(([A-Za-z][0-9][A-Za-z])|([A-Za-z][A-Ha-hJ-Yj-y][0-9][A-Za-z]?))))\s?[0-9][A-Za-z]{2})$")
        Dim match As Match = regexPostCode.Match(postcode.Value)
        If Not match.Success Then
            Dim v As New CustomValidator
            v.ErrorMessage = "Please enter a valid Postcode"
            v.IsValid = False
            Me.Page.Validators.Add(v)
        End If


        If WorkingData.EnrolmentRequestRow.MobileTel = "" And WorkingData.EnrolmentRequestRow.Tel = "" Then
            Dim v As New CustomValidator
            v.ErrorMessage = "Please enter atleast one phone number (Home Telephone / Mobile number)."
            v.IsValid = False
            Me.Page.Validators.Add(v)
        End If
        Dim ActivMonat As Long 'which month
        Dim ActivJahr As Long   'which year
        If IsDate(WorkingData.EnrolmentRequestRow.DateOfBirth) Then

            ActivMonat = If(ActivMonat = 0, Month(CDate(Now())), ActivMonat)
            ActivJahr = If(ActivJahr = 0, Year(Now), ActivJahr)
            'temporary store the age in udf but clear on submit
            If ActivMonat < 7 Then 'if in Jul use next year
                WorkingData.EnrolmentRequestRow.StudentDetailUserDefined1 = Math.Floor(DateDiff(DateInterval.Day, CType(WorkingData.EnrolmentRequestRow.DateOfBirth, Date), CType("31-Aug-" + Right(ActivJahr - 1, 2), Date)) / 365.25)
            Else
                WorkingData.EnrolmentRequestRow.StudentDetailUserDefined1 = Math.Floor(DateDiff(DateInterval.Day, CType(WorkingData.EnrolmentRequestRow.DateOfBirth, Date), CType("31-Aug-" + Right(ActivJahr, 2), Date)) / 365.25)

            End If

            '  If Not Session("startdate") Is Nothing Then Session("agecourse") = Math.Floor(DateDiff(DateInterval.Day, CType(WorkingData.EnrolmentRequestRow.DateOfBirth, Date), CType(Session("startdate"), Date)) / 365.25)
            If WorkingData.EnrolmentRequestRow.StudentDetailUserDefined1 < 15 Then
                Dim v As New CustomValidator
                v.ErrorMessage = "The Training Provider does not accept students under the age of 16 (age is calculated at 31st August 2020)."
                v.IsValid = False
                Me.Page.Validators.Add(v)

            End If
        End If

        'Received Free School Meals
        If Is16To25 = True Then
            If Not ReceivedFreeSchoolMealsY.Checked = True And Not ReceivedFreeSchoolMealsN.Checked = True Then
                fldReceivedFreeSchoolMealsValidator.ErrorMessage = "Please select whether you have receieved free school meals."
                fldReceivedFreeSchoolMealsValidator.IsValid = False
                fldReceivedFreeSchoolMealsValidator.CssClass = "error alert alert-danger"
                ReceivedFreeSchoolMealsYContainer.Attributes.Add("Class", "form-check form-check-inline ErrorContainer")
                ReceivedFreeSchoolMealsNContainer.Attributes.Add("Class", "form-check form-check-inline ErrorContainer")
            End If
        End If

        'Young Carer
        If Not YoungCarerY.Checked = True And Not YoungCarerN.Checked = True Then
            fldYoungCarerValidator.ErrorMessage = "Please select whether you have any caring responsabilities."
            fldYoungCarerValidator.IsValid = False
            fldYoungCarerValidator.CssClass = "error alert alert-danger"
            YoungCarerYContainer.Attributes.Add("Class", "form-check form-check-inline ErrorContainer")
            YoungCarerNContainer.Attributes.Add("Class", "form-check form-check-inline ErrorContainer")
        End If

        'Young Parent
        If Not YoungParentY.Checked = True And Not YoungParentN.Checked = True Then
            fldYoungParentValidator.ErrorMessage = "Please select whether you are a parent."
            fldYoungParentValidator.IsValid = False
            fldYoungParentValidator.CssClass = "error alert alert-danger"
            YoungParentYContainer.Attributes.Add("Class", "form-check form-check-inline ErrorContainer")
            YoungParentNContainer.Attributes.Add("Class", "form-check form-check-inline ErrorContainer")
        End If

        MyBase.ValidateControl()
    End Sub


    Private ReadOnly Property AFD_SERVER As String
        Get
            Return SystemSettings.AFDEvolution_Server
        End Get
    End Property

    Private ReadOnly Property AFD_SERIAL_NUMBER As String
        Get
            Return SystemSettings.AFDEvolution_SerialNumber
        End Get
    End Property

    Private ReadOnly Property AFD_PASSWORD As String
        Get
            Return SystemSettings.AFDEvolution_Password
        End Get
    End Property

    Private ReadOnly Property AFD_USER_ID As String
        Get
            Return SystemSettings.AFDEvolution_UserID
        End Get
    End Property

    Private Enum SearchType
        FastFind
        Search
        Retrieve
    End Enum


    Private Sub UpdateAddress()

        ' Declare XML Objects and variables
        Dim xmlDoc As System.Xml.XmlDocument
        Dim root As System.Xml.XmlNode
        Dim dataNode As System.Xml.XmlNode
        Dim itemNodes As System.Xml.XmlNodeList
        Dim lstStr As String
        Dim xmlLocation As String

        ' Create the XML Document Object Instance
        xmlDoc = New System.Xml.XmlDocument()

        ' Build up the XML query string
        xmlLocation = BuildServerDetails(SearchType.Retrieve)

        ' Replace lstResult with the name of your list box for the results
        With lstresult

            If lstresult.Items.Count = 0 Then
                Exit Sub
            Else
                ' Check a valid item is selected
                If .SelectedIndex < 0 Then
                    Dim v As New CustomValidator
                    v.ErrorMessage = "Please select an item from the list."

                    v.IsValid = False
                    Me.Page.Validators.Add(v)

                    Exit Sub
                End If
            End If
            'Response.Write(.SelectedIndex)
            ' Set XML parameter to retrieve the selected record
            lstStr = .Items.Item(.SelectedIndex).ToString

            xmlLocation = xmlLocation + "&Key=" + lstStr.Substring(lstStr.Length - 40, 40).Trim

            ' Finished with the list box
        End With

        ' Load the XML from the webserver with the query string
        Try

            xmlDoc.Load(xmlLocation)

        Catch
            Dim v As New CustomValidator
            v.ErrorMessage = "Error loading address results, please enter address manually"
            v.IsValid = False
            Me.Page.Validators.Add(v)

            Exit Sub

        End Try

        ' Check if PCE returned an error and if the document is valid
        root = xmlDoc.DocumentElement
        dataNode = root.SelectSingleNode("Result")
        itemNodes = root.SelectNodes("Item")
        If dataNode Is Nothing Or itemNodes Is Nothing Then
            Dim v As New CustomValidator
            v.ErrorMessage = "Error loading address results, please enter address manually"
            v.IsValid = False
            Me.Page.Validators.Add(v)
            Exit Sub
        End If
        If Val(dataNode.InnerText) < 1 Then
            dataNode = root.SelectSingleNode("ErrorText")
            If dataNode Is Nothing Then
                Dim v As New CustomValidator
                v.ErrorMessage = "Error loading address results, please enter address manually"
                v.IsValid = False
                Me.Page.Validators.Add(v)
            Else
                Dim v As New CustomValidator
                v.ErrorMessage = dataNode.InnerText & vbCrLf & "Please enter address manually"
                v.IsValid = False
                Me.Page.Validators.Add(v)

            End If
            Exit Sub
        End If


        Dim strProperty As String = String.Empty

        dataNode = itemNodes(0).SelectSingleNode("Property")
        If Not (dataNode Is Nothing) Then strProperty = dataNode.InnerText

        dataNode = itemNodes(0).SelectSingleNode("Street")
        If Not (dataNode Is Nothing) Then
            If Not CCCBlankLibrary.IsBlank(strProperty) Then
                txtAddress1.Value = String.Format("{0}, {1}", strProperty, dataNode.InnerText)
            Else
                txtAddress1.Value = dataNode.InnerText
            End If
        End If

        dataNode = itemNodes(0).SelectSingleNode("Locality")
        If Not (dataNode Is Nothing) Then txtAddress2.Value = dataNode.InnerText

        dataNode = itemNodes(0).SelectSingleNode("Town")
        If Not (dataNode Is Nothing) Then txtAddress3.Value = dataNode.InnerText

        dataNode = itemNodes(0).SelectSingleNode("PostalCounty")
        If Not (dataNode Is Nothing) Then txtAddress4.Value = dataNode.InnerText

        dataNode = itemNodes(0).SelectSingleNode("Postcode")
        If Not (dataNode Is Nothing) Then
            'txtpostcodeout.Value = Trim(dataNode.InnerText.Substring(0, InStr(1, dataNode.InnerText, " ")))
            'txtpostcodein.Value = Trim(Mid(dataNode.InnerText, InStr(1, dataNode.InnerText, " ") + 1))
            If Not (dataNode Is Nothing) Then
                postcode.Value = dataNode.InnerText
                divAddresslines.Visible = True
            End If
        End If

    End Sub
    Private Sub btnFind_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnFind.Click

        If txtLookup.Text = "" Then
            Dim v As New CustomValidator
            v.ErrorMessage = "Please enter a search term."
            v.IsValid = False
            Me.Page.Validators.Add(v)
            Exit Sub
        End If
        ' Declare XML Objects and variables
        Dim xmlDoc As System.Xml.XmlDocument
        Dim xmlLocation As String

        ' Create the XML Document Object Instance
        xmlDoc = New System.Xml.XmlDocument()

        ' Replace lstResult with the name of your list box for the results
        If lstresult.Items.Count > 0 Then divlstResult.Visible = True
        With lstresult

            ' Clear out any existing items in the list
            .Items.Clear()

            ' Build up the XML query string
            xmlLocation = BuildServerDetails(SearchType.FastFind)

            ' Set the Country Name or ISO code for International operations
            xmlLocation = xmlLocation + "&Country=UK"

            ' Set the lookup string
            xmlLocation = xmlLocation + "&Lookup=" + txtLookup.Text ' Change txtLookup to your lookup entry textbox

            ' Load the XML from the webserver with the query string
            Try
                xmlDoc.Load(xmlLocation)
            Catch
                Dim v As New CustomValidator
                v.ErrorMessage = "Error loading address results, please enter address manually"
                v.IsValid = False
                Me.Page.Validators.Add(v)
                Exit Sub
            End Try

            GetSearchResults(xmlDoc, btnFind)

        End With


    End Sub

    Private Sub GetSearchResults(xmlDoc As System.Xml.XmlDocument, btnButton As Button)
        Dim root As System.Xml.XmlNode
        Dim pcFromNode As System.Xml.XmlNode
        Dim dataNode As System.Xml.XmlNode
        Dim itemNodes As System.Xml.XmlNodeList
        Dim listNode As System.Xml.XmlNode
        Dim keyNode As System.Xml.XmlNode
        With lstresult
            ' Check if PCE returned an error and if the document is valid
            root = xmlDoc.DocumentElement
            dataNode = root.SelectSingleNode("Result")
            itemNodes = root.SelectNodes("Item")
            If dataNode Is Nothing Or itemNodes Is Nothing Then
                Dim v As New CustomValidator
                v.ErrorMessage = "Error loading address results, please enter address manually"
                v.IsValid = False
                Me.Page.Validators.Add(v)
                Exit Sub
            End If
            If Val(dataNode.InnerText) < 1 Then
                dataNode = root.SelectSingleNode("ErrorText")
                If dataNode Is Nothing Then
                    Dim v As New CustomValidator
                    v.ErrorMessage = "Error loading address results, please enter address manually"
                    v.IsValid = False
                    Me.Page.Validators.Add(v)
                Else
                    Dim v As New CustomValidator
                    v.ErrorMessage = dataNode.InnerText & vbCrLf & "Please enter address manually"
                    v.IsValid = False
                    Me.Page.Validators.Add(v)
                End If
                Exit Sub
            End If

            ' Display any changed postcode if applicable
            pcFromNode = itemNodes(0).SelectSingleNode("PostcodeFrom")
            dataNode = itemNodes(0).SelectSingleNode("Postcode")
            If Not (pcFromNode Is Nothing) And Not (dataNode Is Nothing) Then
                If pcFromNode.InnerText <> "" Then
                    Dim v As New CustomValidator
                    v.ErrorMessage = "Postcode has changed from " + pcFromNode.InnerText + " to " + dataNode.InnerText
                    v.IsValid = True
                    Me.Page.Validators.Add(v)
                End If
            End If

            ' Now add matching records to the list box
            For Each dataNode In itemNodes
                ' Get the data nodes
                listNode = dataNode.SelectSingleNode("List")
                keyNode = dataNode.SelectSingleNode("Key")
                If Not (listNode Is Nothing) And Not (keyNode Is Nothing) Then
                    ' Add the item to the list box with hidden key
                    .Items.Add(listNode.InnerText + Space(512) + keyNode.InnerText)
                End If
            Next

            ' If .Items.Count() <> 0 Then .SelectedIndex = 0 ' Select First item in the list

        End With
    End Sub

    Private Sub btnContinue_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnContinue.Click

        SwitchFieldsOnSubmit()

        SetReceivedFreeSchoolMealsValue()
        SetYoungCarerValue()
        SetYoungParentValue()

        Me.Page.Validate()

        If Me.Page.IsValid Then

            WorkingData.EnrolmentRequest(0).Address1 = txtAddress1.Value
            WorkingData.EnrolmentRequest(0).Address2 = txtAddress2.Value
            WorkingData.EnrolmentRequest(0).Address3 = txtAddress3.Value
            WorkingData.EnrolmentRequest(0).Address4 = txtAddress4.Value

            Dim pcode As String = Replace(postcode.Value, " ", "")
            If Len(pcode) > 0 Then

                'avoid dodgy postcodes breaking system
                Try
                    WorkingData.EnrolmentRequestRow.PostcodeOut = pcode.Substring(0, pcode.Length - 3)
                Catch ex As ArgumentOutOfRangeException
                    WorkingData.EnrolmentRequestRow.PostcodeOut = ""
                End Try

                Try
                    WorkingData.EnrolmentRequestRow.PostcodeIn = Right(pcode, 3)
                Catch ex As ArgumentOutOfRangeException
                    WorkingData.EnrolmentRequestRow.PostcodeIn = ""
                End Try

            End If

            '            Dim blnApplicationsOnly As Boolean = WorkingData.ShoppingCart IsNot Nothing AndAlso Not WorkingData.ShoppingCart.ContainsItemsOfType("Enrolment")


        End If

    End Sub


    Private Function BuildServerDetails(ByVal Type As SearchType) As String
        Dim xmlLocation As String
        ' Build up the XML query string
        xmlLocation = AFD_SERVER + "/afddata.pce?"
        xmlLocation = xmlLocation + "Serial=" + AFD_SERIAL_NUMBER + "&"
        xmlLocation = xmlLocation + "Password=" + AFD_PASSWORD + "&"
        xmlLocation = xmlLocation + "UserID=" + AFD_USER_ID + "&"

        Select Case Type
            Case SearchType.FastFind
                xmlLocation = xmlLocation + "Data=Address&Task=FastFind&Fields=List"
            Case SearchType.Search
                xmlLocation = xmlLocation + "Data=Address&Task=Search&Fields=List"
            Case SearchType.Retrieve
                xmlLocation = xmlLocation + "Data=Address&Task=Retrieve&Fields=Standard"
            Case Else

        End Select

        ' Set the maximum number of records to return
        xmlLocation = xmlLocation + "&MaxQuantity=100"

        Return xmlLocation
    End Function

    Protected Sub SwitchFieldsOnSubmit()
        'Set UDF3 to value of UDF53
        WorkingData.EnrolmentRequestRow.StudentDetailUserDefined3 = WorkingData.EnrolmentRequestRow.StudentDetailUserDefined53
        WorkingData.EnrolmentRequestRow.StudentDetailUserDefined8 = WorkingData.EnrolmentRequestRow.StudentDetailUserDefined54
        'Restore original value of UDF53
        WorkingData.EnrolmentRequestRow.StudentDetailUserDefined53 = UDF53CurrentValue
        WorkingData.EnrolmentRequestRow.StudentDetailUserDefined54 = UDF54CurrentValue
    End Sub

    Protected Sub SwitchFieldsBackOnLoad()
        If Not IsNothing(WorkingData.EnrolmentRequestRow.StudentDetailUserDefined3) Then
            'Backup current value of UDF53
            UDF53CurrentValue = WorkingData.EnrolmentRequestRow.StudentDetailUserDefined53
            UDF54CurrentValue = WorkingData.EnrolmentRequestRow.StudentDetailUserDefined54
            'Move value of UDF3 to UDF53 for use in this control
            WorkingData.EnrolmentRequestRow.StudentDetailUserDefined53 = WorkingData.EnrolmentRequestRow.StudentDetailUserDefined3
            WorkingData.EnrolmentRequestRow.StudentDetailUserDefined54 = WorkingData.EnrolmentRequestRow.StudentDetailUserDefined8
        End If
    End Sub

    Protected Sub btnBack_Click(sender As Object, e As EventArgs) Handles btnBack.Click

        SwitchFieldsOnSubmit()

        'If WorkingData.ShoppingCart.ContainsItemsOfType("Application") Then
        '    '   Response.Redirect(GetResourceValue("checkout_applications_aspx"))
        'ElseIf WorkingData.ShoppingCart.ContainsItemsOfType("Enrolment") Then
        '    Response.Redirect(GetResourceValue("checkout_enrolments_aspx"))
        'ElseIf WorkingData.ShoppingCart.ContainsItemsOfType("Enquiry") Then
        '    '   Response.Redirect(GetResourceValue("checkout_enquiries_aspx"))
        'End If

        Response.Redirect("webenrolment.aspx?page=~/webcontrols/courseenrol.ascx&OfferingID=" & OfferingID)

    End Sub
End Class
Partial Class courseenrol
    Inherits webenrolmentcontrolvalidate

    Public ReadOnly Property OfferingID() As Integer
        Get
            If Me.DesignMode OrElse CCCBlankLibrary.IsBlank(Me.Page.Request("OfferingID")) Then
                Return -1
            Else
                Return CInt(Me.Page.Request("OfferingID"))
            End If
        End Get
    End Property

End Class

