FactoryBot.define do
  factory :order_address do

    postal_code    { "000-0000" }
    prefecture_id  { 2 }
    city           { "横浜市" }
    number         { "青山1-1-1"}
    building       { "柳ビル103"}
    phone_number   { "09012345678" }
    # item_id        { @item.id }　クリエイトで作り、パラメーターで受け取っているので必要ない
    # user_id        { @user.id }
    token          { "tok_abcdefghijk00000000000000000"}

    #Formオブジェクトのテストなので「order」でのアソシエーションの記述はいらない。
  end
end
