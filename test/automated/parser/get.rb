require_relative '../automated_init'

context "Parser" do
  context "Get" do
    app = Controls::Application.example
    middleware = Controls::Middleware.example(app)

    sink = Controls::Application::Example.register_telemetry_sink(app)

    request = Controls::Request::Get.example
    response = middleware.(request)

    test 'Records application_called signal' do
      recorded = sink.recorded_once? do |record|
        record.signal == :application_called
      end

      assert(recorded)
    end
  end
end
