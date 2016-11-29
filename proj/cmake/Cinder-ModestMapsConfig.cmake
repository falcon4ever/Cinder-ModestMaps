if( NOT TARGET Cinder-ModestMaps )
	get_filename_component( CINDER_MODESTMAPS_HEADER_PATH "${CMAKE_CURRENT_LIST_DIR}/../../include" ABSOLUTE )
	get_filename_component( CINDER_MODESTMAPS_SOURCE_PATH "${CMAKE_CURRENT_LIST_DIR}/../../src" ABSOLUTE )
	get_filename_component( CINDER_PATH "${CMAKE_CURRENT_LIST_DIR}/../../../.." ABSOLUTE )

	list( APPEND CINDER_MODESTMAPS_SOURCES
		${CINDER_MODESTMAPS_SOURCE_PATH}/Map.cpp
		${CINDER_MODESTMAPS_SOURCE_PATH}/TileLoader.cpp		
	)

	add_library( Cinder-ModestMaps ${CINDER_MODESTMAPS_SOURCES} )

	target_include_directories( Cinder-ModestMaps PUBLIC "${CINDER_MODESTMAPS_SOURCE_PATH}" )
	target_include_directories( Cinder-ModestMaps SYSTEM BEFORE PUBLIC "${CINDER_MODESTMAPS_HEADER_PATH}" )

	if( NOT TARGET cinder )
	    include( "${CINDER_PATH}/proj/cmake/configure.cmake" )
	    find_package( cinder REQUIRED PATHS
	        "${CINDER_PATH}/${CINDER_LIB_DIRECTORY}"
	        "$ENV{CINDER_PATH}/${CINDER_LIB_DIRECTORY}" )
	endif()
	target_link_libraries( Cinder-ModestMaps PRIVATE cinder )
endif()

