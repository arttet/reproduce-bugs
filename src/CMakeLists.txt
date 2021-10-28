project(reproduce-bugs)

add_executable(${PROJECT_NAME})

target_sources(${PROJECT_NAME}
  PRIVATE
    main.cpp
)

target_link_libraries(${PROJECT_NAME}
  PRIVATE
    benchmark::benchmark
    fmt::fmt
    Microsoft.GSL::GSL
)
