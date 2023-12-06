import CodeBlock   from '$lib/components/code-block/+component.svelte'
import Fa          from 'svelte-fa/src/fa.svelte'
import NavLink     from '$lib/components/nav-link/+component.svelte'
import NavLinkFn   from '$lib/components/nav-link-fn/+component.svelte'
import NavLinkNew  from '$lib/components/nav-link-new/+component.svelte'
import { Toaster } from 'svelte-french-toast'

code =
  start:
    install_0:
      code: """
        λ yarn add flame-odm
        """
      copy: """
        yarn add flame-odm
        """
    connect_0:
      code: """
        Adapter = require 'flame-odm/adapter'

        service_account = {
          type: "service_account"
          project_id: "..."
          # ...
        }

        A = new Adapter(service_account)

        module.exports = A
        """
    adapter_0:
      code: """
        Adapter = require 'flame-odm/adapter'
        Secrets = require '<secrets-lib>'

        A = new Adapter((->
          secrets = await Secrets()
          return JSON.parse(secrets.SERVICE_ACCOUNT)
        ))

        module.exports = A
        """
    model_0:
      code: """
        Adapter = require '◆/lib/flame/base/adapter.coffee'
        Model   = require 'flame-odm/model'

        M = new Model('default', {}, Adapter)

        module.exports = M
        """
    model_1:
      code: """
        Model  = require '◆/lib/flame/base/model.coffee'

        M = Model.extend('User', {
          id:    (-> Math.random().toString(36).slice(2, 6))
          name:  null
          email: null
        })

        module.exports = M
        """
    create_0:
      code: """
        User = require '◆/lib/flame/models/user.coffee'

        record = User.create({
          name: 'Dragon'
        })

        console.log(record.obj())
        # => { id: 'kbB4', name: 'Dragon', email: null }

        # ...
        """
    save_0:
      code: """
        # ...

        saved = await record.save()
        console.log(saved)
        # => true
        """
    query_0:
      code: """
        User = require '◆/lib/flame/models/user.coffee'
        Query = require 'flame-odm/query'

        userQ = new Query([
          [ 'eq', 'name', 'Dragon' ]
        ])

        user = await User.find(userQ)
        console.log(user)
        # => { id: 'kbB4', name: 'Dragon', email: null }
        """
  api:
    access:
      'new':
        code: """
          Access = require 'flame-odm/access'

          access = new Access({
            name: [ 'user', 'self' ]
            age:  [ 'self' ]
          })
        """
      screen:
        code: """
          Access = require 'flame-odm/access'

          access = new Access({
            name: [ 'user', 'self' ]
            age:  [ 'self' ]
          })

          screened = access.screen({ name: 'Emma', age: 28 }, [ 'user' ])
          # => { name: 'Emma' }

        """
      fields:
        code: """
          Access = require 'flame-odm/access'

          access = new Access({
            name: [ 'user', 'self' ]
            age:  [ 'self' ]
          })

          fields = access.fields([ 'self' ])
          # => [ 'name', 'age' ]

        """
    adapter:
      connect:
        code: """
          Adapter = require 'flame-odm/adapter'

          service_account = {
            type: "service_account"
            project_id: "..."
            # ...
          }

          adapter = new Adapter(service_account)

          await adapter.connect()
        """
    transact_0:
      code: """
        Adapter  = require 'flame-odm/adapter'
        Alphabet = require '◆/lib/flame/models/alphabet.coffee'
        Query    = require 'flame-odm/query'

        aQ = new Query([
          [ 'eq', 'letter', 'a' ]
        ])

        ok = await Adapter.transact((T) ->
          a = await Alphabet.find(aQ, T)

          if !a
            a2 = Alphabet.create({ letter: 'a' })
            saved = await a2.save(T)

          return (!!a || saved)
        )

        console.log(ok)
        # => true
        """
    traverse_0:
      code: """
        Adapter  = require 'flame-odm/adapter'
        Alphabet = require '◆/lib/flame/models/alphabet.coffee'
        Query    = require 'flame-odm/query'

        alphaQ = new Query([
          [ 'order-by', 'letter' ]
        ])

        delay = (ms -> new Promise(res -> setTimeout(res, ms)))

        await Adapter.traverse('alphabet', ((obj) ->
          await delay(Math.round((Math.random() * 1000)))
          process.stdout.write(obj.letter + ' ')
          return
        ), 13, alphaQ)

        # => h w i d g q y m f o n z b j v a r k x c u l t e p s
        """
    count_0:
      code: """
        Alphabet = require '◆/lib/flame/models/alphabet.coffee'
        Query    = require 'flame-odm/query'

        alphaQ = new Query([
          [ 'gt', 'letter', 'w' ]
        ])

        total = await Alphabet.count(alphaQ)
        # => 3
        """
    delete_0:
      code: """
        Thing = require '◆/lib/flame/models/thing.coffee'

        success = await Thing.del('id')
        # => true
        """
    find_0:
      code: """
        Country = require '◆/lib/flame/models/country.coffee'
        Query   = require 'flame-odm/query'

        countryQ = new Query([
          [ 'eq', 'capital', 'Washington D.C.' ]
        ])

        country = await Country.find(countryQ)
        # => { name: 'United States', capital: 'Washington D.C.' }
        """
    find_all_0:
      code: """
        Alphabet = require '◆/lib/flame/models/alphabet.coffee'
        Query    = require 'flame-odm/query'

        alphaQ = new Query([
          [ 'gt', 'letter', 'w' ]
        ])

        letters = await Alphabet.findAll(alphaQ)
        # => [{ letter: 'x' }, { letter: 'y' }, { letter: 'z' }]
        """
    get_0:
      code: """
        Thing = require '◆/lib/flame/models/thing.coffee'

        thing = await Thing.get('1')
        # => { id: '1' }
        """
    get_all_0:
      code: """
        Thing = require '◆/lib/flame/models/thing.coffee'

        things = await Thing.getAll([ '1', '2', '3' ])
        # => [{ id: '1' }, { id: '2' }, { id: '3' }]
        """
    save_0:
      code: """
        User = require '◆/lib/flame/models/user.coffee'

        record = User.create({
          name: 'Turtle'
        })

        await record.save()
        # => true
        """
    update_0:
      code: """
        User = require '◆/lib/flame/models/user.coffee'

        record = User.fragment('1', {
          name: 'Snapping Turtle'
        })

        await record.update()
        # => true
        """
    delete_0:
      code: """
        User = require '◆/lib/flame/models/user.coffee'

        record = User.fragment('1')

        await record.del()
        # => true
        """
    obj_0:
      code: """
        User = require '◆/lib/flame/models/user.coffee'

        record = User.create({
          name: 'Object'
        })

        console.log(record.obj())
        # => { id: 'kxC2', name: 'Object', email: null }

        # ...
        """


