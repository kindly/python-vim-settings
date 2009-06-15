import sys
imported = sys.argv[1]
# sqlalchemy.orm
mod = __import__(imported)
dup_list = []

def check_not_built_in_type(item):
        if isinstance(item, type([])) or\
           isinstance(item, basestring) or\
           isinstance(item, set) or\
           isinstance(item, file) or\
           isinstance(item, dict):
            return True

def get_attr_with_list(start_obj, list):
    
    obj = start_obj
    for item in list:
        obj = getattr(obj, item)
    return obj


list1 = []
for list in dir(mod):
    if not list.startswith("_"):
        item = getattr(mod, list)
        item_type = type(item)
        if list in dup_list:
            continue
        print "%s.%s -- %s" % (imported, list, item_type.__name__)
        dup_list.append(list)
        list1.append(list)

def get_out_obj(obj_list):

    new_list = []
    for list in obj_list:
        list_list = list.split(".")
        obj = get_attr_with_list(mod, list_list)
        for sublist in dir(obj):
            item = getattr(obj, sublist) 
            item_type = type(item)
            if not sublist.startswith("_") and\
               not sublist.startswith("im_") and\
               not sublist.startswith("func_"):
                if check_not_built_in_type(obj):
                    continue
                if sublist in dup_list:
                    continue
                print "%s.%s.%s -- %s" % (imported, list, sublist, item_type.__name__)
                new_list.append("%s.%s" % (list, sublist))
                dup_list.append(sublist)
    return new_list

list2 = get_out_obj(list1)
list3 = get_out_obj(list2)
list4 = get_out_obj(list3)
list5 = get_out_obj(list4)
list6 = get_out_obj(list5)


#list3 = []
#for list in list2:
#    list_list = list.split(".")
#    obj = getattr(getattr(mod,list_list[0]), list_list[1])
#    for sublist in dir(obj):
#        item = getattr(obj, sublist) 
#        item_type = type(item)
#        if not sublist.startswith("_"):
#            if check_not_built_in_type(item):
#                continue
#            print "%s.%s - %s" % (list, sublist, item_type.__name__)
#            list3.append("%s.%s" % (list, sublist))

