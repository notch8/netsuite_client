require File.dirname(__FILE__) + '/test_helper.rb'

class TestNetsuiteClient < Test::Unit::TestCase
  include NetSuite::SOAP

  def setup
    #ENV['NS_ENDPOINT_URL'] ||= 'https://webservices.sandbox.netsuite.com/services/NetSuitePort_2009_1'

    unless ENV['NS_ACCOUNT_ID'] && ENV['NS_EMAIL'] && ENV['NS_PASSWORD']
      puts "Ensure that your environment variables are set: NS_ACCOUNT_ID, NS_EMAIL, NS_PASSWORD"
      exit(-1)
    end

    @client = NetsuiteClient.new(:account_id => ENV['NS_ACCOUNT_ID'], :email => ENV['NS_EMAIL'], :password => ENV['NS_PASSWORD'])
    #@client.debug = true
  end

  def test_init
    assert_not_nil @client
  end

  def test_find_by_internal_id
    records = @client.find_by_internal_ids('TransactionSearchBasic', [1])
    assert_equal [], records
  end

  def test_get
    record = @client.get('RecordType::PaymentMethod', 1)
    assert_not_nil record
    assert_equal 1, record.xmlattr_internalId.to_i
    assert_equal 'NetSuite::SOAP::PaymentMethod', record.class.to_s
  end

  def test_get_all
    records = @client.get_all('RecordType::PaymentMethod')
    assert records.any?
    assert records.all? {|r| r.class.to_s == 'NetSuite::SOAP::PaymentMethod'}
  end

  def test_add_inventory_item
    ref = InventoryItem.new
    ref.itemId = 'test inventory item'
    res = @client.add(ref)
    assert_not_nil res
    #puts res.inspect
    assert res.success? || res.error_code == 'DUP_ITEM'
  end

  def test_find_by_item_id
    test_add_inventory_item
    item = @client.find_by('ItemSearchBasic', 'itemId', 'test inventory item')

    assert_not_nil item
    assert_equal 'NetSuite::SOAP::RecordList', item.class.to_s
    assert_equal 1, item.size
    assert_equal 'NetSuite::SOAP::InventoryItem', item[0].class.to_s
  end

  def test_update_inventory_item
    test_add_inventory_item
    new_name = String.random_string

    item = @client.find_by('ItemSearchBasic', 'itemId', 'test inventory item')[0]
    assert item.displayName != new_name

    ref = InventoryItem.new
    ref.xmlattr_internalId = item.xmlattr_internalId
    ref.displayName = new_name
    res = @client.update(ref)
    assert_not_nil res
    assert res.success?

    item = @client.find_by('ItemSearchBasic', 'itemId', 'test inventory item')[0]
    assert item.displayName == new_name
  end

  def test_delete_inventory_item
    test_add_inventory_item
    item = @client.find_by('ItemSearchBasic', 'itemId', 'test inventory item')[0]
    assert_not_nil item

    ref = InventoryItem.new
    ref.xmlattr_internalId = item.xmlattr_internalId
    res = @client.delete(ref)
    assert_not_nil res
    assert res.success?
    assert_nil @client.find_by('ItemSearchBasic', 'itemId', 'test inventory item')[0]
  end
end
