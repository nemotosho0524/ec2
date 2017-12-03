require 'rails_helper'

RSpec.describe Order, type: :model do
  # 正常系
  context '正常にデータがそろっている場合' do
  	let(:order) { build(:order) }
  	it 'バリデーションに通過する' do
  		expect(order).to be_valid
  	end
  end
  #異常系
  context '正常にデータがそろっていない場合' do

    context 'telがnilの場合' do
      let(:order) { build(:order, tel: nil) }
      it 'バリデーションに失敗する' do
        expect(order).to be_invalid
      end
     end
     
    context 'telが文字列の場合' do
      let(:order) { build(:order, tel: 'hello') }
      it 'バリデーションに失敗する' do
        expect(order).to be_invalid
      end
    end
    
    context 'telが10文字未満の場合' do
      let(:order) { build(:order, tel: '000000000') }
      it 'バリデーションに失敗する' do
        expect(order).to be_invalid
      end
    end

    context 'telが12文字以上の場合' do
      let(:order) { build(:order, tel: '000000000000') }
      it 'バリデーションに失敗する' do
        expect(order).to be_invalid
      end
    end

    context 'emailがnilの場合' do
      let(:order) { build(:order, email: nil) }
      it 'バリデーションに失敗する' do
        expect(order).to be_invalid
      end
    end

    context 'emailが不正の場合' do
      let(:order) { build(:order, email: "aaaa") }
      it 'バリデーションに失敗する' do
        expect(order).to be_invalid
      end
    end

    context 'addressがnilの場合' do
      let(:order) { build(:order, address: nil) }
      it 'バリデーションに失敗する' do
        expect(order).to be_invalid
      end
    end
  end
end