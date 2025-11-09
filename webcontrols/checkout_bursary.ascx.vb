Imports CompassCC.ProSolution.PSWebEnrolmentKit
Imports CompassCC.CCCSystem.CCCCommon

Partial Class checkout_bursary
    Inherits CheckoutBaseControl

    Private Property _lastAttachmentID() As Integer
        Get
            Return CInt(HttpContext.Current.Session("LastAttachmentID"))
        End Get
        Set(ByVal value As Integer)
            HttpContext.Current.Session("LastAttachmentID") = value
        End Set
    End Property

    Public ReadOnly Property OfferingID() As Integer
        Get
            If Me.DesignMode OrElse CCCBlankLibrary.IsBlank(Me.Page.Request("OfferingID")) Then
                Return 68349
            Else
                Return CInt(Me.Page.Request("OfferingID"))
            End If
        End Get
    End Property


    Public ReadOnly Property Refno() As String
        Get
            If Me.DesignMode OrElse CCCBlankLibrary.IsBlank(Me.Page.Request("refno")) Then
                Return ""
            Else
                Return Me.Page.Request("refno")
            End If
        End Get
    End Property
    Protected Overrides Sub OnLoad(e As EventArgs)
        MyBase.OnLoad(e)
            LoadAreas()
                           'chkConfirm.Checked = True

        Session("RequestMode") = RequestMode.ApplicationRequest
	        WorkingData.EnrolmentRequestRow.FirstForename = "Bursary"
        WorkingData.EnrolmentRequestRow.Surname = "Bursary"
        WorkingData.EnrolmentRequestRow.DateOfBirth = "01/01/1900"
        WorkingData.EnrolmentRequestRow.Sex = "F"
      '  WorkingData.ApplicationRequestRow.EthnicGroupID = "98"
      '  WorkingData.ApplicationRequestRow.Address1 = "317 Bursarystreet"
        WorkingData.EnrolmentRequestRow.PostcodeOut = "B66"
        WorkingData.EnrolmentRequestRow.PostcodeIn = "6BZ"
      '  WorkingData.ApplicationRequestRow.CriminalConvictionID = "2"
       WorkingData.EnrolmentRequestRow.Email = "Bursary@lcg.com"
        WorkingData.EnrolmentRequestRow.MobileTel = "0766666893"

        '  Response.Write("----" & WorkingData.ApplicationRequestRow.ApplicationUserDefined3)

        'WorkingData.ApplicationRequestRow.DateOfBirth = "01/01/1900"
        'WorkingData.ApplicationRequestRow.FirstForename = "Bursary"
        'WorkingData.ApplicationRequestRow.Surname = "Bursary"
        'WorkingData.ApplicationRequestRow.Address1 = "Bursary"
        'WorkingData.ApplicationRequestRow.PostcodeIn = "w2"
        'WorkingData.ApplicationRequestRow.PostcodeOut = "22"




        'WorkingData.ApplicationRequestRow.RefNo = Refno()
        If Refno() <> "" Then
            fldrefno.DefaultValue = Refno()
            fldrefno.IsReadOnly = True
        Else
                fldrefno.IsReadOnly = False
            End If
            If WorkingData.ApplicationRequestRow.ApplicationUserDefined1 <> "" Then ddlAsylum.SelectedValue = WorkingData.ApplicationRequestRow.ApplicationUserDefined1
            If WorkingData.ApplicationRequestRow.ApplicationUserDefined2 <> "" Then ddlLive.SelectedValue = WorkingData.ApplicationRequestRow.ApplicationUserDefined2
        If WorkingData.ApplicationRequestRow.ApplicationUserDefined30 <> "" Then ddlIncome.SelectedValue = WorkingData.ApplicationRequestRow.ApplicationUserDefined30
        If WorkingData.ApplicationRequestRow.ReferencesNotes <> "" Then notes.Text = WorkingData.ApplicationRequestRow.ReferencesNotes

            'tick boxes Eligibility for bursary for defined vulnerable groups
            If WorkingData.ApplicationRequestRow.ApplicationUserDefined11 = "True" Then chkInCare.Checked = WorkingData.ApplicationRequestRow.ApplicationUserDefined11
            If WorkingData.ApplicationRequestRow.ApplicationUserDefined12 = "True" Then chkCareLeaver.Checked = WorkingData.ApplicationRequestRow.ApplicationUserDefined12
            If WorkingData.ApplicationRequestRow.ApplicationUserDefined13 = "True" Then checkISorUC.Checked = WorkingData.ApplicationRequestRow.ApplicationUserDefined13
            If WorkingData.ApplicationRequestRow.ApplicationUserDefined14 = "True" Then chkDLAorPIP.Checked = WorkingData.ApplicationRequestRow.ApplicationUserDefined14
            'tick boxes Eligibility for free meals in further education
            If WorkingData.ApplicationRequestRow.ApplicationUserDefined15 = "True" Then chkIncomeSuport.Checked = WorkingData.ApplicationRequestRow.ApplicationUserDefined15
            If WorkingData.ApplicationRequestRow.ApplicationUserDefined16 = "True" Then chkIncomeJSA.Checked = WorkingData.ApplicationRequestRow.ApplicationUserDefined16
            If WorkingData.ApplicationRequestRow.ApplicationUserDefined17 = "True" Then chkIncomeESA.Checked = WorkingData.ApplicationRequestRow.ApplicationUserDefined17
            If WorkingData.ApplicationRequestRow.ApplicationUserDefined18 = "True" Then chkAsylum.Checked = WorkingData.ApplicationRequestRow.ApplicationUserDefined18
            If WorkingData.ApplicationRequestRow.ApplicationUserDefined19 = "True" Then chkStatePen.Checked = WorkingData.ApplicationRequestRow.ApplicationUserDefined19
            If WorkingData.ApplicationRequestRow.ApplicationUserDefined20 = "True" Then chkChildTax.Checked = WorkingData.ApplicationRequestRow.ApplicationUserDefined20
            If WorkingData.ApplicationRequestRow.ApplicationUserDefined21 = "True" Then chkWTC.Checked = WorkingData.ApplicationRequestRow.ApplicationUserDefined21
            If WorkingData.ApplicationRequestRow.ApplicationUserDefined22 = "True" Then chkUC.Checked = WorkingData.ApplicationRequestRow.ApplicationUserDefined22

        If WorkingData.ApplicationRequestRow.ApplicationUserDefined23 <> "" Then ddUniform.SelectedValue = WorkingData.ApplicationRequestRow.ApplicationUserDefined23

        If WorkingData.ApplicationRequestRow.ApplicationUserDefined24 <> "" Then ddMilitaryTopSize.SelectedValue = WorkingData.ApplicationRequestRow.ApplicationUserDefined24
        If WorkingData.ApplicationRequestRow.ApplicationUserDefined25 <> "" Then ddMilitaryWaist.SelectedValue = WorkingData.ApplicationRequestRow.ApplicationUserDefined25
        If WorkingData.ApplicationRequestRow.ApplicationUserDefined26 <> "" Then ddMilitaryBoot.SelectedValue = WorkingData.ApplicationRequestRow.ApplicationUserDefined26
        If WorkingData.ApplicationRequestRow.ApplicationUserDefined27 <> "" Then ddMilitaryBib.SelectedValue = WorkingData.ApplicationRequestRow.ApplicationUserDefined27

        If WorkingData.ApplicationRequestRow.StudentDetailUserDefined3 <> "" Then ddBeautyTunic.SelectedValue = WorkingData.ApplicationRequestRow.StudentDetailUserDefined3
        If WorkingData.ApplicationRequestRow.StudentDetailUserDefined4 <> "" Then ddBeautyTrousers.SelectedValue = WorkingData.ApplicationRequestRow.StudentDetailUserDefined4
        If WorkingData.ApplicationRequestRow.StudentDetailUserDefined5 <> "" Then ddBeautyDress.SelectedValue = WorkingData.ApplicationRequestRow.StudentDetailUserDefined5
        If WorkingData.ApplicationRequestRow.StudentDetailUserDefined6 <> "" Then ddBeautyTshirt.SelectedValue = WorkingData.ApplicationRequestRow.StudentDetailUserDefined6
        If WorkingData.ApplicationRequestRow.StudentDetailUserDefined8 <> "" Then ddBeautyToolkit.SelectedValue = WorkingData.ApplicationRequestRow.StudentDetailUserDefined8

        If WorkingData.ApplicationRequestRow.StudentDetailUserDefined1 <> "" Then ddConstructionTop.SelectedValue = WorkingData.ApplicationRequestRow.StudentDetailUserDefined1
        If WorkingData.ApplicationRequestRow.StudentDetailUserDefined2 <> "" Then ddConstructionWaist.SelectedValue = WorkingData.ApplicationRequestRow.StudentDetailUserDefined2
        If WorkingData.ApplicationRequestRow.StudentDetailUserDefined7 <> "" Then ddConstructionToolkit.SelectedValue = WorkingData.ApplicationRequestRow.StudentDetailUserDefined7




    End Sub


    Private Sub LoadAreas()


         Dim intOfferingID As Integer = 786483
        '  Dim intOfferingID As Integer = 203419


        If OfferingID() <> -1 Then

            Dim tblOffering As New OfferingDataTable
            Dim v As CCCDataViewDataSet = CCCDataViewDataSet.CreateDataView(tblOffering)
            v.Columns.AddPKColumns()
            v.Columns.EnsureColumnsAreSelected(True, False, tblOffering.WebSiteAvailabilityIDColumn, tblOffering.CourseInformationIDColumn, tblOffering.TotalFeeAmountColumn, tblOffering.OfferingTypeIDColumn)
            v.Filters.SetColumnFilter(tblOffering.OfferingIDColumn, OfferingID())
            tblOffering.TableAdapter.Load(tblOffering, v)


            If tblOffering.Count > 0 AndAlso tblOffering(0).WebSiteAvailabilityID.HasValue Then
                Dim item As New ShoppingCartItem()
                With tblOffering(0)

                    'Dim CourseOfferingFees As New CourseOfferingFees(CType(.OfferingID, Integer))
                    If .TotalFeeAmount.HasValue Then
                        item.Cost = CDec(.TotalFeeAmount.Value.ToString())
                    End If
                    item.Description = .GetRowDescription
                    item.ItemType = "Application"
                    item.OfferingID = .OfferingID.Value
                    item.CourseInfoID = .CourseInformationID.GetValueOrDefault

                End With
                With WorkingData.ShoppingCart
                    WorkingData.ClearWorkingData()
                    If Not .Items.Contains(item) Then
                        .Items.Add(item)
                    End If
                End With
            End If
        End If


      '  PopulateOfferingFeeTable()
        loadAttachments()

    End Sub

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
            vOffering.Columns.EnsureColumnsAreSelected(True, False, tblOffering.CodeColumn, tblOffering.StartTimeColumn, tblOffering.DayOfWeekColumn, tblOffering.StartDateColumn, tblOffering.EndDateColumn, tblOffering.SiteDescriptionColumn, tblOffering.EndTimeColumn)
            vOffering.Columns.EnsureColumnIsSelected(False, False, tblOffering.KISCourseCodeColumn)

            vOffering.Filters.SetColumnFilter(tblOffering.OfferingIDColumn, stb.ToString, FilterOperator.OperatorInList)

            tblOffering.TableAdapter.Load(tblOffering, vOffering)


        End If
    End Sub


    Protected Sub rptAttachments_ItemCommand(source As Object, e As RepeaterCommandEventArgs)
        If (e.CommandName = "RemoveAttachment") Then
            Dim attachmentID = CCCDataTypeConverter.Convert(Of Integer)(e.CommandArgument)
            Dim rowToDelete = WorkingData.EnrolmentRequestAttachments.FindByAttachmentID(attachmentID)
            If (rowToDelete IsNot Nothing) Then
                WorkingData.EnrolmentRequestAttachments.RemoveRow(rowToDelete)
                loadAttachments()
            End If
        End If
    End Sub




    Private Sub btnUpload_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnUpload.Click
        trNoItems.Visible = False
        Page.MaintainScrollPositionOnPostBack = True
        'Me.Page.Validate()

        ''Following line is important to perform validations on File Upload control based on setup done on control.
        Me.fuAttachment.ValidateFile()

     '   If Not Me.Page.IsValid Then
      '      Return
       ' End If


        Dim rowAttachment = WorkingData.EnrolmentRequestAttachments.NewRow
        _lastAttachmentID -= 1
        With rowAttachment
            .AttachmentID = _lastAttachmentID
            .TypeOfEvidence = (ddlTypeOfEvidence.SelectedValue & System.DateTime.Now)
            '    .Notes = txtNotes.Text.Trim
            .Attachment = fuAttachment.FileBytes
            .FileName = fuAttachment.FileName
            .Size = fuAttachment.FileBytes.Length
            If CCCAttachmentThumbnailGenerator.FilenameIndicatesFileIsCompatibleImage(fuAttachment.FileName) Then
                Try
                    .ImageThumb = CCCAttachmentThumbnailGenerator.CreateThumbnailAsByteArray(.Attachment, 96)
                Catch ex As Exception
                    ' Cannot create thumb nail- ignore error
                    .ImageThumb = Nothing ' No thumb-nail
                End Try
            End If
            .CreatedDate = DateTime.Now
        End With
        WorkingData.EnrolmentRequestAttachments.AddRow(rowAttachment)
        ''Reload attachments to refresh the grid and clear the controls for user to do fresh entry again.
        loadAttachments()
        ' txtNotes.Text = Nothing
        ddlTypeOfEvidence.SelectedIndex = 0
    End Sub

    Private Sub CheckDetails()

        'add selected eligibility items to AUDF1

        'Dim StrSupport As String = String.Empty
        'If Not chkVulnerable.SelectedValue = "" Then
        '    For Each item As ListItem In chkVulnerable.Items
        '        If item.Selected Then
        '            StrSupport = " | " & StrSupport & item.Value & " | "
        '        End If
        '    Next
        'Else
        '    StrSupport = ""
        'End If

        'Dim StrSupport2 As String = String.Empty
        'If Not chkFreeMeals.SelectedValue = "" Then
        '    For Each item As ListItem In chkFreeMeals.Items
        '        If item.Selected Then
        '            StrSupport2 = " | " & StrSupport2 & item.Value & " | "
        '        End If
        '    Next
        'Else
        '    StrSupport2 = ""
        'End If

        ' WorkingData.ApplicationRequestRow.ApplicationUserDefined3 = StrSupport
        'WorkingData.ApplicationRequestRow.ApplicationUserDefined4 = StrSupport2
    End Sub

    Public Overrides Sub ValidateControl()


        If ddUniform.SelectedValue = "" Then
            Dim v As New CustomValidator()
            v.ErrorMessage = "Please confirm if you need support with uniform."
            v.IsValid = False
            Me.Page.Validators.Add(v)

            Me.ValidationSummary2.ShowSummary = True
        End If

        If ddUniform.SelectedValue = "Yes - Military Uniform" Then
            If ddMilitaryTopSize.SelectedValue = "" Then
                Dim v As New CustomValidator()
                v.ErrorMessage = "Please tell us your Top Size."
                v.IsValid = False
                Me.Page.Validators.Add(v)

                Me.ValidationSummary2.ShowSummary = True
            End If
            If ddMilitaryWaist.SelectedValue = "" Then
                Dim v As New CustomValidator()
                v.ErrorMessage = "Please tell us your Waist Size."
                v.IsValid = False
                Me.Page.Validators.Add(v)

                Me.ValidationSummary2.ShowSummary = True
            End If
            If ddMilitaryBoot.SelectedValue = "" Then
                Dim v As New CustomValidator()
                v.ErrorMessage = "Please tell us your Boot Size."
                v.IsValid = False
                Me.Page.Validators.Add(v)

                Me.ValidationSummary2.ShowSummary = True
            End If
            If ddMilitaryBib.SelectedValue = "" Then
                Dim v As New CustomValidator()
                v.ErrorMessage = "Please tell us your Bib Colour."
                v.IsValid = False
                Me.Page.Validators.Add(v)

                Me.ValidationSummary2.ShowSummary = True
            End If

        End If


        If Not chkConfirm.Checked Then
            Dim v As New CustomValidator()
            v.ErrorMessage = "Please confirm that you have read the declaration above."
            v.IsValid = False
            Me.Page.Validators.Add(v)

            Me.ValidationSummary2.ShowSummary = True
        End If

        If ddlAsylum.SelectedValue = "" Then
            Dim v As New CustomValidator()
            v.ErrorMessage = "Please tell us if you are you an Asylum Seeker?"
            v.IsValid = False
            Me.Page.Validators.Add(v)

            Me.ValidationSummary2.ShowSummary = True
        End If

        If ddlLive.SelectedValue = "" Then
            Dim v As New CustomValidator()
            v.ErrorMessage = "Please tell us if you Who you live with?"
            v.IsValid = False
            Me.Page.Validators.Add(v)

            Me.ValidationSummary2.ShowSummary = True
        End If
        If ddlIncome.SelectedValue = "" Then
            Dim v As New CustomValidator()
            v.ErrorMessage = "Please tell us Is the total gross annual income for your household below £30,000"
            v.IsValid = False
            Me.Page.Validators.Add(v)

            Me.ValidationSummary2.ShowSummary = True
        End If
        If WorkingData.ApplicationRequestRow.ApplicationUserDefined6 = "" And WorkingData.ApplicationRequestRow.ApplicationUserDefined7 = "" Then
            Dim v As New CustomValidator()
            v.ErrorMessage = "Please state the gross annual income for at least 1 adult"
            v.IsValid = False
            Me.Page.Validators.Add(v)

            Me.ValidationSummary2.ShowSummary = True
        End If
        'If trNoItems.Visible = True AndAlso Not ChkOverride.checked Then

        '    Dim a As New CustomValidator
        '    a.ErrorMessage = "Please upload some evidence, or tick 'I cant upload Evidence'"
        '    a.IsValid = False
        '    Me.Page.Validators.Add(a)
        '    Me.ValidationSummary1.ShowSummary = True


        'End If




    End Sub

    Public Sub btnContinue_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnContinue.Click


        Me.Page.Validate()

        If Me.Page.IsValid Then

            'CheckDetails()

            Dim chkconfirm As Boolean = True

            WorkingData.ApplicationRequestRow.StudentDeclaration = chkconfirm
            If ddlAsylum.SelectedValue <> "" Then WorkingData.ApplicationRequestRow.ApplicationUserDefined1 = ddlAsylum.SelectedValue
            If ddlLive.SelectedValue <> "" Then WorkingData.ApplicationRequestRow.ApplicationUserDefined2 = ddlLive.SelectedValue
            If ddlIncome.SelectedValue <> "" Then WorkingData.ApplicationRequestRow.ApplicationUserDefined30 = ddlIncome.SelectedValue
            If notes.Text <> "" Then WorkingData.ApplicationRequestRow.ReferencesNotes = notes.Text

            'tick boxes Eligibility for bursary for defined vulnerable groups
            WorkingData.ApplicationRequestRow.ApplicationUserDefined11 = chkInCare.Checked
            WorkingData.ApplicationRequestRow.ApplicationUserDefined12 = chkCareLeaver.Checked
            WorkingData.ApplicationRequestRow.ApplicationUserDefined13 = checkISorUC.Checked
            WorkingData.ApplicationRequestRow.ApplicationUserDefined14 = chkDLAorPIP.Checked
            'tick boxes Eligibility for free meals in further education
            WorkingData.ApplicationRequestRow.ApplicationUserDefined15 = chkIncomeSuport.Checked
            WorkingData.ApplicationRequestRow.ApplicationUserDefined16 = chkIncomeJSA.Checked
            WorkingData.ApplicationRequestRow.ApplicationUserDefined17 = chkIncomeESA.Checked
            WorkingData.ApplicationRequestRow.ApplicationUserDefined18 = chkAsylum.Checked
            WorkingData.ApplicationRequestRow.ApplicationUserDefined19 = chkStatePen.Checked
            WorkingData.ApplicationRequestRow.ApplicationUserDefined20 = chkChildTax.Checked
            WorkingData.ApplicationRequestRow.ApplicationUserDefined21 = chkWTC.Checked
            WorkingData.ApplicationRequestRow.ApplicationUserDefined22 = chkUC.Checked

            WorkingData.ApplicationRequestRow.StudentDetailUserDefined3 = ddBeautyTunic.SelectedValue
            WorkingData.ApplicationRequestRow.StudentDetailUserDefined4 = ddBeautyTrousers.SelectedValue
            WorkingData.ApplicationRequestRow.StudentDetailUserDefined5 = ddBeautyDress.SelectedValue
            WorkingData.ApplicationRequestRow.StudentDetailUserDefined6 = ddBeautyTshirt.SelectedValue
            WorkingData.ApplicationRequestRow.StudentDetailUserDefined8 = ddBeautyToolkit.SelectedValue

            WorkingData.ApplicationRequestRow.ApplicationUserDefined23 = ddUniform.SelectedValue

            WorkingData.ApplicationRequestRow.ApplicationUserDefined24 = ddMilitaryTopSize.SelectedValue
            WorkingData.ApplicationRequestRow.ApplicationUserDefined25 = ddMilitaryWaist.SelectedValue
            WorkingData.ApplicationRequestRow.ApplicationUserDefined26 = ddMilitaryBoot.SelectedValue
            WorkingData.ApplicationRequestRow.ApplicationUserDefined27 = ddMilitaryBib.SelectedValue

            WorkingData.ApplicationRequestRow.StudentDetailUserDefined1 = ddConstructionTop.SelectedValue
            WorkingData.ApplicationRequestRow.StudentDetailUserDefined2 = ddConstructionWaist.SelectedValue
            WorkingData.ApplicationRequestRow.StudentDetailUserDefined7 = ddConstructionToolkit.SelectedValue



            'Response.Write(OfferingID())
            Response.Redirect(GetResourceValue("checkout_makepayment_aspx"))

        End If

    End Sub

    Private Sub loadAttachments()
        rptAttachments.DataSource = WorkingData.EnrolmentRequestAttachments
        rptAttachments.DataBind()
        If (WorkingData.EnrolmentRequestAttachments.Rows.Count = 0) Then
            trNoItems.Visible = True
        Else
            trNoItems.Visible = False
        End If
    End Sub

End Class
