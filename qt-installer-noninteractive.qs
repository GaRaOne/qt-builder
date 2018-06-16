// https://github.com/rabits/dockerfiles/blob/master/5.9-desktop/extract-qt-installer.sh

function Controller() {
    installer.installationFinished.connect(function() {
        gui.clickButton(buttons.NextButton);
    });
    installer.setMessageBoxAutomaticAnswer("OverwriteTargetDirectory", QMessageBox.Yes);
    installer.setMessageBoxAutomaticAnswer("installationErrorWithRetry", QMessageBox.Ignore);
}
Controller.prototype.WelcomePageCallback = function() {
    console.log("Welcome Page");
    gui.clickButton(buttons.NextButton, 3000);
}
Controller.prototype.CredentialsPageCallback = function() {
    gui.clickButton(buttons.CommitButton);
}
Controller.prototype.ComponentSelectionPageCallback = function() {
    console.log("Select components");
    var widget = gui.currentPageWidget();
    widget.selectAll() 
    gui.clickButton(buttons.NextButton);
}
Controller.prototype.IntroductionPageCallback = function() {
    console.log("Introduction Page");
    console.log("Retrieving meta information from remote repository");
    gui.clickButton(buttons.NextButton);
}
Controller.prototype.TargetDirectoryPageCallback = function() {
    console.log("Set target installation page: /opt/qt");
    var widget = gui.currentPageWidget();
    if (widget != null) {
        widget.TargetDirectoryLineEdit.setText("/opt/qt");
    }
    gui.clickButton(buttons.NextButton);
}
Controller.prototype.LicenseAgreementPageCallback = function() {
    console.log("Accept license agreement");
    var widget = gui.currentPageWidget();
    if (widget != null) {
        widget.AcceptLicenseRadioButton.setChecked(true);
    }
    gui.clickButton(buttons.NextButton);
}
Controller.prototype.ReadyForInstallationPageCallback = function() {
    console.log("Ready to install");
    gui.clickButton(buttons.CommitButton);
}
Controller.prototype.FinishedPageCallback = function() {
    var widget = gui.currentPageWidget();
    if (widget.LaunchQtCreatorCheckBoxForm) {
        // No this form for minimal platform
        widget.LaunchQtCreatorCheckBoxForm.launchQtCreatorCheckBox.setChecked(false);
    }
    gui.clickButton(buttons.FinishButton);
}