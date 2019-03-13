require 'wings/active_fedora_converter'

module Wings
  module PcdmValkyrieBehavior
    ##
    # Gives the subset of #members that are PCDM objects
    # @return [Enumerable<ActiveFedora::Base> | Enumerable<Valkyrie::Resource>] an enumerable over the members
    #   that are PCDM objects
    def objects(valkyrie: false)
      af_objects = Wings::ActiveFedoraConverter.new(resource: self).convert.objects
      return af_objects unless valkyrie
      af_objects.map(&:valkyrie_resource)
    end

    ##
    # Gives a subset of #member_ids, where all elements are PCDM objects.
    # @return [Enumerable<String> | Enumerable<Valkyrie::ID] the object ids
    def object_ids(valkyrie: false)
      objects(valkyrie: valkyrie).map(&:id)
    end
  end
end
