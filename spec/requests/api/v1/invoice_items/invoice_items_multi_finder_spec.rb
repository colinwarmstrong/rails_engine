require 'rails_helper'

describe 'Invoice Items Multi Finder API' do
  context 'GET /api/v1/invoice_items/find_all?paramaters' do
    it 'returns all invoice items by id' do
      id = 14
      create(:invoice_item, id: id)

      get "/api/v1/invoice_items/find_all?id=#{id}"

      invoice_items = JSON.parse(response.body)
      invoice_item = invoice_items.first

      expect(response).to be_successful
      expect(invoice_items.count).to eq(1)
      expect(invoice_item['id']).to eq(id)
      expect(invoice_item).to have_key('item_id')
      expect(invoice_item).to have_key('invoice_id')
      expect(invoice_item).to have_key('quantity')
      expect(invoice_item).to have_key('unit_price')
    end

    it 'returns all invoice items by item id' do
      valid_item_id = create(:item).id
      invalid_item_id = create(:item).id
      create_list(:invoice_item, 3, item_id: valid_item_id)
      create_list(:invoice_item, 4, item_id: invalid_item_id)

      get "/api/v1/invoice_items/find_all?item_id=#{valid_item_id}"

      invoice_items = JSON.parse(response.body)
      invoice_item = invoice_items.first

      expect(response).to be_successful
      expect(invoice_items.count).to eq(3)
      expect(invoice_item['item_id']).to eq(valid_item_id)
      expect(invoice_item).to have_key('item_id')
      expect(invoice_item).to have_key('invoice_id')
      expect(invoice_item).to have_key('quantity')
      expect(invoice_item).to have_key('unit_price')
    end

    it 'returns all invoice items by invoice id' do
      valid_invoice_id = create(:invoice).id
      invalid_invoice_id = create(:invoice).id
      create_list(:invoice_item, 3, invoice_id: valid_invoice_id)
      create_list(:invoice_item, 4, invoice_id: invalid_invoice_id)

      get "/api/v1/invoice_items/find_all?invoice_id=#{valid_invoice_id}"

      invoice_items = JSON.parse(response.body)
      invoice_item = invoice_items.first

      expect(response).to be_successful
      expect(invoice_items.count).to eq(3)
      expect(invoice_item['invoice_id']).to eq(valid_invoice_id)
      expect(invoice_item).to have_key('item_id')
      expect(invoice_item).to have_key('invoice_id')
      expect(invoice_item).to have_key('quantity')
      expect(invoice_item).to have_key('unit_price')
    end

    # it 'returns all invoice items by quantity' do
    #   quantity = create(:invoice_item).quantity
    #
    #   get "/api/v1/invoice_items/find_all?quantity=#{quantity}"
    #
    #   invoice_item = JSON.parse(response.body)
    #
    #   expect(response).to be_successful
    #   expect(invoice_item['quantity']).to eq(quantity)
    #   expect(invoice_item).to have_key('item_id')
    #   expect(invoice_item).to have_key('invoice_id')
    #   expect(invoice_item).to have_key('quantity')
    #   expect(invoice_item).to have_key('unit_price')
    # end
    #
    # it 'returns all invoice items by unit_price' do
    #   unit_price = create(:invoice_item).unit_price
    #
    #   get "/api/v1/invoice_items/find_all?unit_price=#{unit_price}"
    #
    #   invoice_item = JSON.parse(response.body)
    #
    #   expect(response).to be_successful
    #   expect(invoice_item['unit_price']).to eq((unit_price.to_f / 100).round(2).to_s)
    #   expect(invoice_item).to have_key('item_id')
    #   expect(invoice_item).to have_key('invoice_id')
    #   expect(invoice_item).to have_key('quantity')
    #   expect(invoice_item).to have_key('unit_price')
    # end
    #
    # it 'returns all invoice items by created_at' do
    #   created_at = '2012-03-27 14:54:09 UTC'
    #   create(:invoice_item, created_at: created_at)
    #
    #   get "/api/v1/invoice_items/find_all?created_at=#{created_at}"
    #
    #   invoice_item = JSON.parse(response.body)
    #
    #   expect(response).to be_successful
    #   expect(invoice_item).to have_key('item_id')
    #   expect(invoice_item).to have_key('invoice_id')
    #   expect(invoice_item).to have_key('quantity')
    #   expect(invoice_item).to have_key('unit_price')
    # end
    #
    # it 'returns all invoice items by updated at' do
    #   updated_at = '2012-03-27 14:54:09 UTC'
    #   create(:invoice_item, updated_at: updated_at)
    #
    #   get "/api/v1/invoice_items/find_all?updated_at=#{updated_at}"
    #
    #   invoice_item = JSON.parse(response.body)
    #
    #   expect(response).to be_successful
    #   expect(invoice_item).to have_key('item_id')
    #   expect(invoice_item).to have_key('invoice_id')
    #   expect(invoice_item).to have_key('quantity')
    #   expect(invoice_item).to have_key('unit_price')
    # end
  end
end
