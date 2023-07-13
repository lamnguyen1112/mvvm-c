
.PHONY: generated
generated: # Generating swiftgen
	@printf '\n\033[32m===== generate swiftgen files =====\033[0m\n'
	swiftgen

.PHONY: generate_keys
generate_keys: # Generating secure keys
	@printf '\n\033[32m===== generate keys =====\033[0m\n'
	sskeys generate

.PHONY: format_code
format_code: # Format source
	@printf '\n\033[32m===== Format Source Code =====\033[0m\n'
	swiftformat --config project.swiftformat.yml .

# Manage localization using gsheet
#.PHONY: generate_l10n_gsheet
#generate_l10n_gsheet: # Generate l10n from google sheet
#	@printf '\n\033[32m===== Download localization =====\033[0m\n'
#	wget --output-file="logs.csv" "https://docs.google.com/spreadsheets/d/1giduGKMt32nHyMwSGDzBoW5tZ_Usqr-YKYsLvofxlXs/export?format=csv&gid=2073152857" -O "Localizations.csv"
#	babelish csv2strings
#	@$(MAKE) update_resources
#	@printf '\n\033[32m===== remove localization templates =====\033[0m\n'
#	rm Localizations.csv
#	rm logs.csv
