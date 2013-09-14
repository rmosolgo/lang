

shared_examples_for 'data value' do

  it {should respond_to(:to_english)}
  it {should respond_to(:to_api_query)}

end
