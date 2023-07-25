class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    # １. データを受け取り新規登録するためのインスタンス作成
    @book = Book.new(book_params)
    # 2. データをデータベースに保存するためのsaveメソッド実行
    if @book.save
      # 3. フラッシュメッセージを定義し、詳細画面へリダイレクト
      flash[:notice] = "successfully"
      redirect_to book_path(@book.id)
    else
      flash.now[:notice] = "not successfully"
      render :new
    end
  end


  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def create
       @book = Book.new(book_params)
    if @book.save
      # 3. フラッシュメッセージを定義し、詳細画面へリダイレクト
      flash[:notice] = "successfully"
      redirect_to book_path(@book.id)
    else
      render :new
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)
  end

  def destroy
    book = Book.find(params[:id])  # データ（レコード）を1件取得
    book.destroy  # データ（レコード）を削除
    redirect_to '/books'  # 投稿一覧画面へリダイレクト
  end

  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end


end