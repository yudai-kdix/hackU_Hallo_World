class ChatsController < GptController

    def index
    end
  
    # 入力したテキストに対して返答
    def search
      @query = params[:query]
  
      response = @client.chat(
        parameters: {
            model: "gpt-3.5-turbo",
            messages: [{ role: "user", content: @query }],
           
        })
  
      @chats = response.dig("choices", 0, "message", "content")
    end
  end