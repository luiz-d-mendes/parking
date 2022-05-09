require 'rails_helper'

RSpec.describe "vendas/new", type: :view do
  before(:each) do
    assign(:venda, Venda.new(
      user: nil,
      caixa: nil,
      valor: 1.5,
      tipo_pagamento: 1,
      locacao: nil
    ))
  end

  it "renders new venda form" do
    render

    assert_select "form[action=?][method=?]", vendas_path, "post" do

      assert_select "input#venda_user_id[name=?]", "venda[user_id]"

      assert_select "input#venda_caixa_id[name=?]", "venda[caixa_id]"

      assert_select "input#venda_valor[name=?]", "venda[valor]"

      assert_select "input#venda_tipo_pagamento[name=?]", "venda[tipo_pagamento]"

      assert_select "input#venda_locacao_id[name=?]", "venda[locacao_id]"
    end
  end
end
