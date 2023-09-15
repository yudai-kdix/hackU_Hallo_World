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
            messages: [
                        { role: "system", content: "今から与える文章について4択の問題を作り答えてください" },
                        { role: "user", content: @query }],
        })
  
      @chats = response.dig("choices", 0, "message", "content")
    end
  end