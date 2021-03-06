require 'minitest/autorun'
require_relative '../lib/product'

describe Product do
  let(:product) { Product.new("Tomato", :fruit, %w(red salad sour) ) }
  let(:expected_result) { <<EOF
    <tr>
      <th>Tomato</th>
      <th>Fruit</th>
      <td>
        <ul>
          <li>red</li>
          <li>salad</li>
          <li>sour</li>
        </ul>
      </td>
    </tr>
EOF
}
  it "can be printed as a HTML table row" do
    product_decorator = ProductDecorator.new product

    product_decorator.as_html_row.
      strip.gsub(/(^\s+)|\n/, "").
        must_equal expected_result.
          strip.gsub /(^\s+)|\n/, ""
  end
end
