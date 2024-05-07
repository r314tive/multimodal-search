include .env

# local sqitch exec path
sqitch := ./src/sqitch

deploy status verify plan:
	$(sqitch) $@ $P
revert:
	$(sqitch) revert --to @HEAD^ $P
revert_all:
	$(sqitch) revert $P
# for any sqitch commands, например make cmd="add m_search_init -n 'm_search_init'"
sqitch:
	$(sqitch) $(cmd)
