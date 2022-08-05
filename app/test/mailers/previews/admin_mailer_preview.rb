class UserMailerPreview < ActionMailer::UserMailerPreview
    def update_email
        AdminMailer.update_email(Admin.forst, Admin.last)
    end
end