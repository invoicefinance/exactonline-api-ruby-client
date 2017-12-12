require 'spec_helper'

describe Elmas::BankAccount do
  it "can initialize" do
    bank_account = Elmas::BankAccount.new
    expect(bank_account).to be_a(Elmas::BankAccount)
  end

  it "accepts attribute setter" do
    bank_account = Elmas::BankAccount.new
    bank_account.bank_account = "78238"
    expect(bank_account.bank_account).to eq "78238"
  end

  it "returns value for getters" do
    bank_account = Elmas::BankAccount.new(account: "123")
    expect(bank_account.account).to eq "123"
  end

  it "is valid with mandatory attributes" do
    bank_account = Elmas::BankAccount.new(account: "1234")
    expect(bank_account.valid?).to eq(true)
  end

  it "is not valid without mandatory attributes" do
    bank_account = Elmas::BankAccount.new
    expect(bank_account.valid?).to eq(false)
  end

  let(:resource) { resource = Elmas::BankAccount.new(id: "12abcdef-1234-1234-1234-123456abcdef", account: "12abcdef-1234-1234-1234-123456abcdef") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("crm/BankAccounts(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("crm/BankAccounts?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("crm/BankAccounts?$filter=Account+eq+guid'12abcdef-1234-1234-1234-123456abcdef'&$filter=ID+eq+guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:account, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
      expect(Elmas).to receive(:get).with("crm/BankAccounts?$orderby=Account&$filter=Account+eq+guid'12abcdef-1234-1234-1234-123456abcdef'&$filter=ID+eq+guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:account, :id], order_by: :account)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("crm/BankAccounts?$orderby=Account")
      resource.find_all(order_by: :account)
    end
  end

  context "Applying select" do
    it "should apply one select" do
      expect(Elmas).to receive(:get).with("crm/BankAccounts?$select=Account")
      resource.find_all(select: [:account])
    end

    it "should apply one select with find_by" do
      expect(Elmas).to receive(:get).with("crm/BankAccounts?$select=Account")
      resource.find_by(select: [:account])
    end

    it "should apply one select" do
      expect(Elmas).to receive(:get).with("crm/BankAccounts?$select=Account,Id")
      resource.find_all(select: [:account, :id])
    end
  end
end
