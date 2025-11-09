Imports CompassCC.ProSolution.PSWebEnrolmentKit
Imports CompassCC.CCCSystem.CCCCommon

Partial Class checkout_enrolments4_Initial_IAG
    Inherits CheckoutBaseControl


    Protected Overrides Sub OnLoad(e As EventArgs)

        If WorkingData.EnrolmentRequestRow.EnrolmentUserDefined1 <> "" Then txtCurrentQual.Value = WorkingData.EnrolmentRequestRow.EnrolmentUserDefined1
        If WorkingData.EnrolmentRequestRow.EnrolmentUserDefined2 <> "" Then selectDropDownCourseEntryRequirement.SelectedValue = WorkingData.EnrolmentRequestRow.EnrolmentUserDefined2
        If WorkingData.EnrolmentRequestRow.EnrolmentUserDefined3 <> "" Then txtLearnDif.Value = WorkingData.EnrolmentRequestRow.EnrolmentUserDefined3
        If WorkingData.EnrolmentRequestRow.EnrolmentUserDefined4 <> "" Then txtJobInterests.Value = WorkingData.EnrolmentRequestRow.EnrolmentUserDefined4
        If WorkingData.EnrolmentRequestRow.EnrolmentUserDefined5 <> "" Then txtSkillsNecessary.Value = WorkingData.EnrolmentRequestRow.EnrolmentUserDefined5
        If WorkingData.EnrolmentRequestRow.EnrolmentUserDefined6 <> "" Then txtSkillsAlready.Value = WorkingData.EnrolmentRequestRow.EnrolmentUserDefined6
        If WorkingData.EnrolmentRequestRow.EnrolmentUserDefined7 <> "" Then txtSkillsImprove.Value = WorkingData.EnrolmentRequestRow.EnrolmentUserDefined7
        If WorkingData.EnrolmentRequestRow.EnrolmentUserDefined8 <> "" Then selectDropDownCompleted.SelectedValue = WorkingData.EnrolmentRequestRow.EnrolmentUserDefined8
        If WorkingData.EnrolmentRequestRow.EnrolmentUserDefined9 <> "" Then txtCriminalPolice.Value = WorkingData.EnrolmentRequestRow.EnrolmentUserDefined9
        If WorkingData.EnrolmentRequestRow.EnrolmentUserDefined10 <> "" Then txtOtherCourses.Value = WorkingData.EnrolmentRequestRow.EnrolmentUserDefined10
        If WorkingData.EnrolmentRequestRow.EnrolmentUserDefined11 <> "" Then txtCompleteStudies.Value = WorkingData.EnrolmentRequestRow.EnrolmentUserDefined11
        If WorkingData.EnrolmentRequestRow.EnrolmentUserDefined12 <> "" Then txtEnrolledOtherCourse.Value = WorkingData.EnrolmentRequestRow.EnrolmentUserDefined12
        If WorkingData.EnrolmentRequestRow.EnrolmentUserDefined13 <> "" Then selectDropDown1619Year11.SelectedValue = WorkingData.EnrolmentRequestRow.EnrolmentUserDefined13
        If WorkingData.EnrolmentRequestRow.EnrolmentUserDefined14 <> "" Then selectDropDown1619SchoolFE.SelectedValue = WorkingData.EnrolmentRequestRow.EnrolmentUserDefined14
        If WorkingData.EnrolmentRequestRow.EnrolmentUserDefined15 <> "" Then selectDropDown1619HE.SelectedValue = WorkingData.EnrolmentRequestRow.EnrolmentUserDefined15
        If WorkingData.EnrolmentRequestRow.EnrolmentUserDefined16 <> "" Then selectDropDown1619CustodyRemand.SelectedValue = WorkingData.EnrolmentRequestRow.EnrolmentUserDefined16
        If WorkingData.EnrolmentRequestRow.EnrolmentUserDefined17 <> "" Then selectDropDownOfferLevel3.SelectedValue = WorkingData.EnrolmentRequestRow.EnrolmentUserDefined17
        If WorkingData.EnrolmentRequestRow.EnrolmentUserDefined18 <> "" Then selectDropDownNationalSkillsFund.SelectedValue = WorkingData.EnrolmentRequestRow.EnrolmentUserDefined18


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

        MyBase.RenderControl(writer)

    End Sub

    Private Sub btnContinue_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnContinue.Click

        Me.Page.Validate()

        If Me.Page.IsValid Then

            WorkingData.EnrolmentRequestRow.EnrolmentUserDefined1 = txtCurrentQual.Value
            WorkingData.EnrolmentRequestRow.EnrolmentUserDefined2 = selectDropDownCourseEntryRequirement.SelectedValue
            WorkingData.EnrolmentRequestRow.EnrolmentUserDefined3 = txtLearnDif.Value
            WorkingData.EnrolmentRequestRow.EnrolmentUserDefined4 = txtJobInterests.Value
            WorkingData.EnrolmentRequestRow.EnrolmentUserDefined5 = txtSkillsNecessary.Value
            WorkingData.EnrolmentRequestRow.EnrolmentUserDefined6 = txtSkillsAlready.Value
            WorkingData.EnrolmentRequestRow.EnrolmentUserDefined7 = txtSkillsImprove.Value
            WorkingData.EnrolmentRequestRow.EnrolmentUserDefined8 = selectDropDownCompleted.SelectedValue
            WorkingData.EnrolmentRequestRow.EnrolmentUserDefined9 = txtCriminalPolice.Value
            WorkingData.EnrolmentRequestRow.EnrolmentUserDefined10 = txtOtherCourses.Value
            WorkingData.EnrolmentRequestRow.EnrolmentUserDefined11 = txtCompleteStudies.Value
            WorkingData.EnrolmentRequestRow.EnrolmentUserDefined12 = txtEnrolledOtherCourse.Value
            WorkingData.EnrolmentRequestRow.EnrolmentUserDefined13 = selectDropDown1619Year11.SelectedValue
            WorkingData.EnrolmentRequestRow.EnrolmentUserDefined14 = selectDropDown1619SchoolFE.SelectedValue
            WorkingData.EnrolmentRequestRow.EnrolmentUserDefined15 = selectDropDown1619HE.SelectedValue
            WorkingData.EnrolmentRequestRow.EnrolmentUserDefined16 = selectDropDown1619CustodyRemand.SelectedValue
            WorkingData.EnrolmentRequestRow.EnrolmentUserDefined17 = selectDropDownOfferLevel3.SelectedValue
            WorkingData.EnrolmentRequestRow.EnrolmentUserDefined18 = selectDropDownNationalSkillsFund.SelectedValue



            'WorkingData.EnrolmentRequestRow.StudentDetailUserDefined19 = chkPrevExcluded.Checked



        End If

    End Sub

    Public Overrides Sub ValidateControl()

        If selectDropDownCourseEntryRequirement.SelectedValue = "" Then
            Dim v As New CustomValidator
            v.ErrorMessage = "* Does the applicants’ qualifications/experience meet the course entry requirements? must not be blank"
            v.IsValid = False
            Me.Page.Validators.Add(v)
        End If

        If selectDropDownCompleted.SelectedValue = "" Then
            Dim v As New CustomValidator
            v.ErrorMessage = "* Have you completed any aspect of this course previously? must not be blank"
            v.IsValid = False
            Me.Page.Validators.Add(v)
        End If

        If selectDropDown1619Year11.SelectedValue = "" Then
            Dim v As New CustomValidator
            v.ErrorMessage = "* Have they completed year 11 at school (or will by start date) and doesn’t intend on returning to full time education or has left compulsory full time education? must not be blank"
            v.IsValid = False
            Me.Page.Validators.Add(v)
        End If

        If selectDropDown1619SchoolFE.SelectedValue = "" Then
            Dim v As New CustomValidator
            v.ErrorMessage = "* Are they attending school or FE as a learner? must not be blank"
            v.IsValid = False
            Me.Page.Validators.Add(v)
        End If

        If selectDropDown1619HE.SelectedValue = "" Then
            Dim v As New CustomValidator
            v.ErrorMessage = "* Are they in HE, including holiday periods, and intends to return? must not be blank"
            v.IsValid = False
            Me.Page.Validators.Add(v)
        End If

        If selectDropDown1619CustodyRemand.SelectedValue = "" Then
            Dim v As New CustomValidator
            v.ErrorMessage = "* Are they in custody or remand? must not be blank"
            v.IsValid = False
            Me.Page.Validators.Add(v)
        End If

        If selectDropDownOfferLevel3.SelectedValue = "" Then
            Dim v As New CustomValidator
            v.ErrorMessage = "* Learning Curve Group have made me aware of the offer of a first full level 3 via the National Skills Fund and checked my eligibility for National Skills Fund? must not be blank"
            v.IsValid = False
            Me.Page.Validators.Add(v)
        End If

        If selectDropDownNationalSkillsFund.SelectedValue = "" Then
            Dim v As New CustomValidator
            v.ErrorMessage = "* Is the learner eligible for National Skills Fund? must not be blank"
            v.IsValid = False
            Me.Page.Validators.Add(v)
        End If

        MyBase.ValidateControl()
    End Sub

End Class
