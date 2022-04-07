require 'rails_helper'

RSpec.describe 'Posts', type: :system do
  let(:title) { 'ポケモン' }
  let(:content) { 'アルセウスほしいなぁ。' }

  before do
    @post = Post.create!(title: title, content: content)
  end

  it '設定された値が表示されること' do
    # Post編集画面を開く
    visit edit_post_path(@post)

    # 失敗するテストの例
    # expect(page).to have_field 'title', with: title

    # 成功するテストの例
    expect(page).to have_field 'post[title]', with: title
  end

end
