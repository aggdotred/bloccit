class FavoriteMailer < ActionMailer::Base
  default from: "hevyw8@gmail.com"

  def new_comment(user, post, comment)
    @user = user
    @post = post
    @comment = comment


    headers["Message-ID"] = "<comments/#{@comment.id}@bloccit.com>"
    headers["In-Reply-To"] = "<post/#{@post.id}@bloccit.com>"
    headers["References"] = "<post/#{@post.id}@bloccit.com>"

    mail(to: user.email, subject: "New comment on #{post.title}")
  end
end
