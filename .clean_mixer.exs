[
  components: [
    {"TicketingSystem", "lib/ticketing_system.ex", group: :entrypoint},
    {"Ticket", "lib/ticketing_system/domain/entities/ticket.ex", group: :entities},
    {"TicketRepo", "lib/ticketing_system/domain/repositories/ticket_repo.ex", group: :repositories},
    {"CreatePriorityTicket", "lib/ticketing_system/domain/use_cases/create_priority_ticket.ex", group: :use_cases},
    {"CallNextTicket", "lib/ticketing_system/domain/use_cases/call_next_ticket.ex", group: :use_cases},
    {"CallTicketByCode", "lib/ticketing_system/domain/use_cases/call_ticket_by_code.ex", group: :use_cases},
    {"GetLastCalledTickets", "lib/ticketing_system/domain/use_cases/get_last_called_tickets.ex", group: :use_cases},
    {"CreateCommonTicket", "lib/ticketing_system/domain/use_cases/create_common_ticket.ex", group: :use_cases},
    {"TicketPriorityDispatcher", "lib/ticketing_system/domain/services/ticket_priority_dispatcher.ex", group: :services},
    {"TicketController", "lib/ticketing_system/adapters/controllers/ticket_controller.ex", group: :adapters},
    {"TicketView", "lib/ticketing_system/adapters/views/ticket_view.ex", group: :adapters},
    {"TicketSchema", "lib/ticketing_system/infra/repositories/sqlite/schemas/ticket_schema.ex", group: :repositories},
    {"TicketRepoImpl", "lib/ticketing_system/infra/repositories/sqlite/ticket_repo_impl.ex", group: :repositories},
    {"SqliteRepo", "lib/ticketing_system/infra/persistence/sqlite_repo.ex", group: :persistence},
    {"TicketPriorityDispatcherImpl", "lib/ticketing_system/infra/services/ticket_priority_dispatcher_impl.ex", group: :services}
  ]
]


# [
#   components: [
#     {"ticketing_system", "lib/ticketing_system.ex", group: :entrypoint},
#     {"entity", "lib/ticketing_system/domain/entities", group: :domain},
#     {"controller", "lib/ticketing_system/adapters/controllers", group: :adapters},
#     {"view", "lib/ticketing_system/adapters/views", group: :adapters},
#     {"use_case", "lib/ticketing_system/domain/use_cases", group: :domain},
#     {"repository", "lib/ticketing_system/domain/repositories", group: :domain},
#     {"repository_impl", "lib/ticketing_system/infra/repositories", group: :infra},
#     {"priority_dispatcher", "lib/ticketing_system/infra/services", group: :infra}
#   ]
# ]
