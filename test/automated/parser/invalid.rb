require_relative '../automated_init'

context "Parser" do
  context "Invalid" do
    middleware = Controls::Middleware.example

    request = Controls::Request::Post::Invalid.example
    response = middleware.(request)

    test "Status" do
      status = Controls::Parse::Status.(response)
      assert(status == 400)
    end

    test "Headers" do
      header = Controls::Parse::Header.(response, "Content-Type")
      assert(header == "application/json")
    end

    test "Body" do
      body = Controls::Parse::Body.(response)
      parsed_body = JSON.parse(body)
      assert(parsed_body["error"] == "Failed to parse body as JSON.")
    end
  end
end
