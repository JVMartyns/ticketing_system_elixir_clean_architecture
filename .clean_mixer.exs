[
  components: [
    {"ticketing_system", "lib/ticketing_system.ex", group: :entrypoint},
    {"ticket", "lib/ticketing_system/domain/entities/ticket.ex", group: :entities},
    {"ticket_repo", "lib/ticketing_system/domain/repositories/ticket_repo.ex", group: :repositories},
    {"create_priority_ticket", "lib/ticketing_system/domain/use_cases/create_priority_ticket.ex", group: :use_cases},
    {"call_next_ticket", "lib/ticketing_system/domain/use_cases/call_next_ticket.ex", group: :use_cases},
    {"call_ticket_by_code", "lib/ticketing_system/domain/use_cases/call_ticket_by_code.ex", group: :use_cases},
    {"get_last_called_tickets", "lib/ticketing_system/domain/use_cases/get_last_called_tickets.ex", group: :use_cases},
    {"create_common_ticket", "lib/ticketing_system/domain/use_cases/create_common_ticket.ex", group: :use_cases},
    {"ticket_controller", "lib/ticketing_system/adapters/controllers/ticket_controller.ex", group: :adapters},
    {"ticket_view", "lib/ticketing_system/adapters/views/ticket_view.ex", group: :adapters},
    {"ticket_schema", "lib/ticketing_system/infra/repositories/sqlite/schemas/ticket_schema.ex", group: :persistence},
    {"ticket_repo_impl", "lib/ticketing_system/infra/repositories/sqlite/ticket_repo_impl.ex", group: :persistence},
    {"sqlite_repo", "lib/ticketing_system/infra/repositories/sqlite/repo.ex", group: :persistence},
    {"ticket_priority_dispatcher", "lib/ticketing_system/infra/services/ticket_priority_dispatcher.ex", group: :infra},
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
