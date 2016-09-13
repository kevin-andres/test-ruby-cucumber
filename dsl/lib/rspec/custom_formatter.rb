require 'rspec/core/formatters/html_formatter'

class CustomFormatter < RSpec::Core::Formatters::HtmlFormatter
    def report_header
        <<-EOF
            <div class="rspec-report">

            <div id="rspec-header">
                <div id="label">
                    <h1>QA InfoTech - Spec Test Run Report</h1>
                </div>

                <div id="summary">
                    <p id="totals">&nbsp;</p>
                    <p id="duration">&nbsp;</p>
                </div>
            </div>

            <div class="results">
        EOF
    end
end