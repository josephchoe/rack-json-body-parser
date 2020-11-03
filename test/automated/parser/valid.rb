require_relative '../automated_init'

context "Parser" do
  context "Valid" do
    test_namespace = "test_namespace"
    data = Controls::Request::Post.data
    app = Controls::Application.example
    middleware = Controls::Middleware.example(app, test_namespace)

    sink = Controls::Application::Example.register_telemetry_sink(app)

    request = Controls::Request::Post.example
    response = middleware.(request)

    test "Env Updated" do
      assert(request[test_namespace] == data)
    end

    test 'Records application_called signal' do
      recorded = sink.recorded_once? do |record|
        record.signal == :application_called
      end

      assert(recorded)
    end
  end
end
