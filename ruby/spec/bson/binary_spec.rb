# encoding: utf-8
require "spec_helper"

module BSON
  describe Binary do
    let(:type) { 5.chr }

    it_behaves_like "a bson element"

    context "when the type is :generic" do
      let(:obj)  { Binary.new("testing") }
      let(:bson) { "#{7.to_bson}#{0.chr}testing" }
      it_behaves_like "a serializable bson element"
      it_behaves_like "a deserializable bson element"
    end

    context "when the type is :function" do
      let(:obj)  { Binary.new("testing", :function) }
      let(:bson) { "#{7.to_bson}#{1.chr}testing" }
      it_behaves_like "a serializable bson element"
      it_behaves_like "a deserializable bson element"
    end

    context "when the type is :old" do
      let(:obj)  { Binary.new("testing", :old) }
      let(:bson) { "#{11.to_bson}#{2.chr}#{7.to_bson}testing" }
      it_behaves_like "a serializable bson element"
      it_behaves_like "a deserializable bson element"
    end

    context "when the type is :uuid_old" do
      let(:obj)  { Binary.new("testing", :uuid_old) }
      let(:bson) { "#{7.to_bson}#{3.chr}testing" }
      it_behaves_like "a serializable bson element"
      it_behaves_like "a deserializable bson element"
    end

    context "when the type is :uuid" do
      let(:obj)  { Binary.new("testing", :uuid) }
      let(:bson) { "#{7.to_bson}#{4.chr}testing" }
      it_behaves_like "a serializable bson element"
      it_behaves_like "a deserializable bson element"
    end

    context "when the type is :md5" do
      let(:obj)  { Binary.new("testing", :md5) }
      let(:bson) { "#{7.to_bson}#{5.chr}testing" }
      it_behaves_like "a serializable bson element"
      it_behaves_like "a deserializable bson element"
    end

    context "when the type is :user" do
      let(:obj)  { Binary.new("testing", :user) }
      let(:bson) { "#{7.to_bson}#{128.chr}testing" }
      it_behaves_like "a serializable bson element"
      it_behaves_like "a deserializable bson element"
    end
  end
end
