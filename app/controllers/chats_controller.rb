class ChatsController < GptController

    def index
    end

    def Chatgptedit
    end
  
    def search
      @query = params[:query]
  
      response = @client.chat(
        parameters: {
            model: "gpt-3.5-turbo",
            messages: [{ role: "user", content: @query }],
        })
  
      @chats = response.dig("choices", 0, "message", "content")
      render :Chatgptedit
      
    end

    def create
      @chat = Chat.new()
      @chat.content = params[:query]
      @chat.user_id = current_user.id
      @chat.save

      @res = []
      if test # 選択した内容
        @res.push({role: "system", content: "私は教員です。あなたは小学生から中学生向けの問題作成を手伝ってください。私が送信する内容に沿った問題を提示してください。" })
      elsif 
        @res.push({role: "system", content: "私は教員です。あなたは小学生から中学生向けの問題作成を手伝ってください。私が送信する内容に沿った問題を提示してください。" })
      else
        @res.push({role: "system", content: "私は教員です。あなたは小学生から中学生向けの問題作成を手伝ってください。私が送信する内容に沿った問題を提示してください。" })
      end
      Chat.all.each do |c|
        @res.push({ role: 'user', content: c.content })
      end

      response = @client.chat(
        parameters: {
          model: 'gpt-3.5-turbo',
          messages: @res
        }
      )

      @chats = response.dig('choices', 0, 'message', "content")
      render :Chatgptedit
    end
  end