class ChatsController < GptController

    def index
    html = File.read("#{Rails.root}/public/chat.html")
    kit = PDFKit.new(html, :page_size => 'B5')
    # kit.stylesheets << "#{Rails.root}/public/styles.css"
    kit.to_file("#{Rails.root}/public/print.pdf")
    send_data kit.to_pdf, filename: 'print.pdf', type: 'application/pdf'
    end

    def edit
      render 'edit', layout: 'application'
    end
  
    def search
      @query = params[:query]
  
      response = @client.chat(
        parameters: {
            model: "gpt-3.5-turbo",
            messages: [{ role: "user", content: @query }],
        })
  
      @chats = response.dig("choices", 0, "message", "content")
      render :edit, layout: 'application'
    end

    def create
      @chat = Chat.new()
      @chat.content = params[:query]
      @chat.user_id = current_user.id
      @chat.save

      @res = []
      @res.push({role: "system", content: "私は教員です。あなたは小学生から中学生向けの問題作成を手伝ってください。私が送信する内容に沿った問題を提示してください。" })
      @res.push({role: "system", content: "問題の形式は" + params[:question] + "で出力してください" })

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