Imports CompassCC.ProSolution.PSWebEnrolmentKit
Imports CompassCC.CCCSystem.CCCCommon

Partial Class checkout_quals_on_entry
    Inherits CheckoutBaseControl

    Public CourseInformationID As Integer

    Public ReadOnly Property OfferingID() As Integer
        Get
            Return WorkingData.ShoppingCart.Items(0).OfferingID
        End Get
    End Property

    Protected Overrides Sub OnLoad(e As EventArgs)
        CourseInformationID = CourseInformationHelper.GetCourseInformationID(Me.Session)

        'If WorkingData.EnrolmentRequestRow.StudentDetailUserDefined12 <> "" Then fldGCSEEngCoF.Value = WorkingData.EnrolmentRequestRow.StudentDetailUserDefined12
        ' If WorkingData.EnrolmentRequestRow.StudentDetailUserDefined13 <> "" Then fldGCSEEngGrade.Value = WorkingData.EnrolmentRequestRow.StudentDetailUserDefined13
        'If WorkingData.EnrolmentRequestRow.StudentDetailUserDefined14 <> "" Then fldGCSEMathCoF.Value = WorkingData.EnrolmentRequestRow.StudentDetailUserDefined14
        'If WorkingData.EnrolmentRequestRow.StudentDetailUserDefined15 <> "" Then fldGCSEMathGrade.Value = WorkingData.EnrolmentRequestRow.StudentDetailUserDefined15
        If WorkingData.EnrolmentRequestRow.StudentDetailUserDefined19 <> "" Then selectDropDownLearnerExcluded.SelectedValue = WorkingData.EnrolmentRequestRow.StudentDetailUserDefined19
        If WorkingData.EnrolmentRequestRow.StudentDetailUserDefined60 <> "" Then txtAnotherFundedCourse.Value = WorkingData.EnrolmentRequestRow.StudentDetailUserDefined60


        'If WorkingData.EnrolmentRequestRow.StudentDetailUserDefined19 = "True" Then chkPrevExcluded.Checked = True
        'If WorkingData.EnrolmentRequestRow.StudentDetailUserDefined19 = "False" Then chkPrevExcluded.Checked = False


        If Not Session("age") Is Nothing Then
            '  lblAge.Text = CType("Your age on 31st Aug: " & Session("age") & " (" & Session("ageGroup"), String) & ")"
            If Session("age") < 19 Then

                '  fldStudyElse.Visible = True
                ' fldStudyElse.IsRequired = True
                '   fldPrevSch.Visible = True
                '   fldPrevSch.IsRequired = True
            Else
                ' fldStudyElse.Visible = False
                '  fldStudyElse.IsRequired = False
                '   fldPrevSch.Visible = False
                '   fldPrevSch.IsRequired = False
                If Session("offeringtype") <> "HE HEFCE Funded" Then
                    '      fldHEQualsOnEntryID.Visible = False
                Else
                    '      fldHEQualsOnEntryID.IsRequired = True
                End If
            End If
        End If

        MyBase.OnLoad(e)

    End Sub

    Protected Overrides Sub CreateChildControls()
        MyBase.CreateChildControls()

        'If IsPostBack Then

        'Recreate the header row
        Dim rowH As New TableRow

        Dim c1, c2, c3, c4, c5 As New TableCell
        c1.Text = "Qualification"
        c1.Attributes.Add("class", "text=center")
        c2.Text = "Subject"
        c3.Text = "Actual Grade"
        c4.Text = "Predicted Grade"
        c5.Text = "Date Awarded"
        rowH.Cells.AddRange({c1, c2, c3, c4, c5})

        tblQuals.Rows.Add(rowH)

        If IsPostBack Then
            Dim c As Control = GetPostBackControl(Me.Page)
            If c.GetType Is GetType(Button) Then
                Dim btn = DirectCast(c, Button)
                If btn.Text = "Add Row" Then
                    intCurrentQuals += 1
                ElseIf btn.ID = "btnNoPriorQualifications" Then
                    intCurrentQuals = 0
                    WorkingData.EnrolmentRequestQualsOnEntry.Clear()
                    slidingdiv.Visible = Not slidingdiv.Visible
                    If slidingdiv.Visible Then
                        btn.Text = "No prior qualifications"
                        btn.ToolTip = "Click to remove all the items listed below (And hide the list)"
                    Else
                        btn.Text = "Add prior qualifications"
                        btn.ToolTip = "Click to show a list below that you can add Qualifications to"
                    End If
                End If
            End If
        End If

        If slidingdiv.Visible Then

            For i = 0 To intCurrentQuals
                Dim row As New TableRow
                Dim cell1, cell2, cell3, cell4, cell5 As New TableCell
                Dim ctl1, ctl2, ctl3, ctl4, ctl5 As New StudentQualsOnEntryField


                ctl1.StudentQualsOnEntryFieldType = StudentQualsOnEntryFieldType.QualID
                ctl1.StudentQualsOnEntryRowNumber = i
                ctl1.LabelWidth = 0
                cell1.Controls.Add(ctl1)

                ctl2.StudentQualsOnEntryFieldType = StudentQualsOnEntryFieldType.Subject
                ctl2.StudentQualsOnEntryRowNumber = i
                ctl2.LabelWidth = 0
                cell2.Controls.Add(ctl2)

                ctl3.StudentQualsOnEntryFieldType = StudentQualsOnEntryFieldType.Grade
                ctl3.StudentQualsOnEntryRowNumber = i
                ctl3.LabelWidth = 0
                'ctl3.ExcludedIDValues = "1,2,3,4,5,6,7,8,9,0" 'This would exclude certain grades from the drop down list
                cell3.Controls.Add(ctl3)

                ctl4.StudentQualsOnEntryFieldType = StudentQualsOnEntryFieldType.PredictedGrade
                ctl4.StudentQualsOnEntryRowNumber = i
                ctl4.LabelWidth = 0
                cell4.Controls.Add(ctl4)

                ctl5.StudentQualsOnEntryFieldType = StudentQualsOnEntryFieldType.DateAwarded
                ctl5.StudentQualsOnEntryRowNumber = i
                ctl5.LabelWidth = 0
                ctl5.CustomFieldType = CCCFieldType.Date
                ctl5.HTML5InputType = Html5InputType.date
                cell5.Controls.Add(ctl5)

                row.Cells.AddRange({cell1, cell2, cell3, cell4, cell5})
                tblQuals.Rows.Add(row)

            Next
        End If
    End Sub


    Public Property intCurrentQuals() As Integer
        Get
            Return CInt(HttpContext.Current.Session("intQualRows"))
        End Get
        Set(ByVal value As Integer)
            HttpContext.Current.Session("intQualRows") = value
        End Set
    End Property

    Public Overrides Sub RenderControl(writer As HtmlTextWriter)
        ' Move UK to top of Nationality Drop Down
        Dim ctlLanguage As DropDownList = TryCast(fldLanguage.InternalFieldControl, DropDownList)

        Dim itemEnglish = ctlLanguage.Items.FindByValue("1") ' United Kingdom


        ctlLanguage.Items.Remove(itemEnglish)
        ctlLanguage.Items.Insert(1, itemEnglish)

        MyBase.RenderControl(writer)

    End Sub

    Private Sub btnContinue_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnContinue.Click

        Me.Page.Validate()

        If Me.Page.IsValid Then

          '  WorkingData.EnrolmentRequestRow.StudentDetailUserDefined12 = fldGCSEEngCoF.Value
           ' WorkingData.EnrolmentRequestRow.StudentDetailUserDefined13 = fldGCSEEngGrade.Value
           ' WorkingData.EnrolmentRequestRow.StudentDetailUserDefined14 = fldGCSEMathCoF.Value
           ' WorkingData.EnrolmentRequestRow.StudentDetailUserDefined15 = fldGCSEMathGrade.Value
            WorkingData.EnrolmentRequestRow.StudentDetailUserDefined19 = selectDropDownLearnerExcluded.SelectedValue
            WorkingData.EnrolmentRequestRow.StudentDetailUserDefined60 = txtAnotherFundedCourse.Value


            'WorkingData.EnrolmentRequestRow.StudentDetailUserDefined19 = chkPrevExcluded.Checked



        End If

    End Sub

    Public Overrides Sub ValidateControl()

        If selectDropDownLearnerExcluded.SelectedValue = "" Then
            Dim v As New CustomValidator
            v.ErrorMessage = "* Has learner been excluded from learning prior to LCG? must not be blank"
            v.IsValid = False
            Me.Page.Validators.Add(v)
        End If

        If WorkingData.EnrolmentRequestRow.PriorAttainmentLevelID <> "99" And intCurrentQuals = 0 Then
            Dim v As New CustomValidator
            v.ErrorMessage = "* You have indicated that you have prior qualifications, please add these under 'Your Qualifications'"
            v.IsValid = False
            Me.Page.Validators.Add(v)
        End If

        

        MyBase.ValidateControl()
    End Sub

End Class
