class UsersController < ApplicationController
  def index
    @users = [
      User.new(
            id: 1,
            name: 'Masha',
            username: 'attarochka'
      ),
      User.new(
            id: 2,
            name: 'Sasha',
            username: 'Zuluzs'
      )
    ]
  end

  def new
  end

  def edit
  end

  def show
    @user = User.new(
                  name: 'Alexander',
                  username: 'anikram',
                  avatar_url: 'https://ru.gravatar.com/avatar/a4ea88e2f841603eaed3ea528a834a42'

    )

    @questions = [
      Question.new(text: 'Как дела?', created_at: Date.parse('27.03.2017')),
      Question.new(text: 'Какой ваш любимый цвет?', created_at: Date.parse('27.03.2017'))
    ]

    @new_question = Question.new
  end
end
