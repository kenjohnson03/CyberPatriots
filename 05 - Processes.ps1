######################################################################
#                                                                    #
#                         Managing services                          #
#                          from PowerShell                           #
#                                                                    #
######################################################################


# Finds services that are named Microsoft and are in the Stopped state then output to grid view
get-service | ? { $_.DisplayName -like "*microsoft*" -and $_.Status -eq "Stopped" } | ogv

# Finds services that are named Microsoft and are in the Stopped state then measure the count
get-service | ? { $_.DisplayName -like "*microsoft*" -and $_.Status -eq "Stopped" } | measure